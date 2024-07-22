FiveM Player Position
This script allows to save and restore the position of the players in an FiveM server. The positions are saved in a MySQL database and the players are automatically teleported to their last saved position when they reconnect.

Features
Automatic Save: Saves the player's position in the database when logging out.
Automatic Restoration: Teleports the player to his last saved position when reconnecting.
Manual Command: Players can use the /save command to manually save their current position.
Use
Place the server files.lua and client.lua in your FiveM resource.
Make sure that your server is configured to use a MySQL database.
Start your resource and connect to the server to test the backup and restore of positions.
Configuration
MySQL-Async: This script uses the MySQL-Async library for database operations.
Database: Create a player_positions table with the identify, x, y, z columns to store the positions of the players.
