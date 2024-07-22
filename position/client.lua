-- client.lua

-- Téléporte le joueur à la position sauvegardée lors de la reconnexion
RegisterNetEvent('example:teleportPlayer')
AddEventHandler('example:teleportPlayer', function(x, y, z)
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, x, y, z)
end)

-- Commande pour sauvegarder manuellement la position
RegisterCommand('save', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    TriggerServerEvent('example:savePlayerPosition', playerCoords.x, playerCoords.y, playerCoords.z)
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        multiline = true,
        args = {"Système", "Position sauvegardée avec succès."}
    })
end, false)

-- Demande au serveur de téléporter le joueur une fois complètement chargé
AddEventHandler('playerSpawned', function()
    TriggerServerEvent('example:teleportPlayerRequest')
end)

-- Affiche un message de débogage dans la console
RegisterNetEvent('example:showMessage')
AddEventHandler('example:showMessage', function(message)
    if message then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"Débogage", message}
        })
    end
end)

-- Vérifie que le script client est bien chargé
Citizen.CreateThread(function()
    -- Script client chargé
end)
