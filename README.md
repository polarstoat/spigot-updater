# Spigot updater (macOS)

> Automatically create/update a Spigot Minecraft server on macOS

![macOS](https://img.shields.io/badge/macOS-10.11.6-brightgreen.svg)
![Minecraft](https://img.shields.io/badge/Minecraft-1.10.2-brightgreen.svg)

## Requirements

* You must have Java installed ([Java 8](https://java.com/download/) is recommended)

## Setup

1. Make a folder for your server

   ```sh
   $ mkdir minecraft_server
   ```

2. Clone this repository into it

   ```sh
   $ git clone https://github.com/polarstoat/spigot-updater.git minecraft_server
   ```

3. Run `update.command`

   It will take some time. When finished, there will be a `spigot-X.X.X.jar` file in the server folder

4. Run `start.command`

   This starts the server

## Usage

- `update.command`: Downloads the latest BuildTools.jar, then builds it, and copies the resulting `spigot-X.X.X.jar` file into your server folder
- `start.command`: Starts running the Spigot Minecraft server
