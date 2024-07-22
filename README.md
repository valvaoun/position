# 🎮 FiveM Player Position

![FiveM](https://img.shields.io/badge/FiveM-Framework-blue)
![MySQL](https://img.shields.io/badge/MySQL-Database-orange)
![Lua](https://img.shields.io/badge/Lua-Scripting-yellow)

This script allows for saving and restoring player positions in a FiveM server. Player positions are saved in a MySQL database, and players are automatically teleported to their last saved position upon reconnecting.

## ✨ Features

- **💾 Automatic Save**: Saves the player's position to the database upon disconnection.
- **🔄 Automatic Restore**: Teleports the player to their last saved position upon reconnecting.
- **📝 Manual Save Command**: Players can use the `/save` command to manually save their current position.

## 🚀 Usage

1. Place the `server.lua`,`fxmanifest.lua` and `client.lua` files in your FiveM resource.
2. Ensure your server is configured to use a MySQL database.
3. Start your resource and connect to the server to test position saving and restoring.

## ⚙️ Configuration

- **MySQL-Async**: This script uses the MySQL-Async library for database operations.
- **Database**: Create a `player_positions` table with columns `identifier`, `x`, `y`, `z` to store player positions.

## 🔧 Dependencies

- **MySQL-Async**: Ensure you have the MySQL-Async library installed. [MySQL-Async GitHub Repository](https://github.com/brouznouf/fivem-mysql-async)
- **FiveM**: This script is designed to run on a FiveM server. [FiveM Official Website](https://fivem.net/)

## 📦 Database Installation

Execute the following SQL command to create the necessary database and table:

```sql
CREATE DATABASE IF NOT EXISTS fivem;
USE fivem;
CREATE TABLE IF NOT EXISTS player_positions (
    identifier VARCHAR(50) PRIMARY KEY,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL
);

