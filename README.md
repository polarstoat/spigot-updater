# Spigot updater (macOS)

> Automatically create/update a Spigot Minecraft server on macOS

![macOS](https://img.shields.io/badge/macOS-10.12.2-brightgreen.svg)
![Minecraft](https://img.shields.io/badge/Minecraft-1.11-brightgreen.svg)

## Requirements

- You must have Java installed ([Java 8](https://java.com/download/) is recommended)

## Setup

1. Clone this repository into a new folder for your server, `Minecraft server/`

   ```sh
   git clone https://github.com/polarstoat/spigot-updater.git 'Minecraft server'
   ```

2. Run `update.command`

   It will take some time. When finished, there will be a `spigot-X.jar` file in the server folder.

3. Run `start.command`

   This starts the server

## Usage

- `update.command`: Downloads the latest BuildTools.jar, then builds it, and copies the resulting `spigot-X.jar` file into your server folder
- `start.command`: Starts running the Spigot Minecraft server
