# 🎮 FiveM Player Position


* This script allows for saving and restoring player positions in a FiveM server. 
* Player positions are saved in a MySQL database, and players are automatically teleported to their last saved position upon reconnecting.


# ✨ Features


* 💾 Automatic Save: Saves the player's position to the database upon disconnection.

* 🔄 Automatic Restore: Teleports the player to their last saved position upon reconnecting.

* 📝 Manual Save Command: Players can use the /save command to manually save their current position.

# 🚀 Usage

1. Place the server.lua and client.lua files in your FiveM resource.

2. Ensure your server is configured to use a MySQL database.

3. Start your resource and connect to the server to test position saving and restoring.


# ⚙️ Configuration


 * MySQL-Async: This script uses the MySQL-Async library for database operations.

* Database: Create a player_positions table with columns identifier, x, y, z to store player positions.

# 🔧 Dependencies

* Ensure you have the MySQL-Async library installed and configured in your FiveM server. [MySQL-Async GitHub Repository](https://github.com/brouznouf/fivem-mysql-async.git)
