-- server.lua

MySQL.ready(function()
    -- Connexion à la base de données réussie
end)

local playerPositions = {}

-- Sauvegarde la position du joueur dans la base de données
RegisterNetEvent('example:savePlayerPosition')
AddEventHandler('example:savePlayerPosition', function(x, y, z)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    
    MySQL.Async.execute('REPLACE INTO player_positions (identifier, x, y, z) VALUES (@identifier, @x, @y, @z)', {
        ['@identifier'] = identifier,
        ['@x'] = x,
        ['@y'] = y,
        ['@z'] = z
    })

    playerPositions[identifier] = {x = x, y = y, z = z}
end)

-- Envoie la position sauvegardée au joueur lors de sa connexion
AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.fetchAll('SELECT x, y, z FROM player_positions WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        if result[1] then
            local pos = result[1]
            playerPositions[identifier] = {x = pos.x, y = pos.y, z = pos.z}
        end
    end)
end)

-- Téléporte le joueur après qu'il se soit connecté et a été chargé
RegisterNetEvent('example:teleportPlayerRequest')
AddEventHandler('example:teleportPlayerRequest', function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    local pos = playerPositions[identifier]
    if pos then
        TriggerClientEvent('example:teleportPlayer', src, pos.x, pos.y, pos.z)
    end
end)

-- Sauvegarde la position du joueur lors de sa déconnexion
AddEventHandler('playerDropped', function(reason)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    local playerPed = GetPlayerPed(src)
    local playerCoords = GetEntityCoords(playerPed)
    
    MySQL.Async.execute('REPLACE INTO player_positions (identifier, x, y, z) VALUES (@identifier, @x, @y, @z)', {
        ['@identifier'] = identifier,
        ['@x'] = playerCoords.x,
        ['@y'] = playerCoords.y,
        ['@z'] = playerCoords.z
    })

    playerPositions[identifier] = {x = playerCoords.x, y = playerCoords.y, z = playerCoords.z}
end)

-- Envoie un message de débogage à tous les clients lorsque la ressource démarre
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        TriggerClientEvent('example:showMessage', -1, 'Débogage: Ressource démarrée.')
    end
end)
