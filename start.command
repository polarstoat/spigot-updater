#!/usr/bin/env bash
#
# Starts the Spigot Minecraft server

# Change into server directory
cd "$(dirname "$0")"

# Start server with Java options from
# https://www.spigotmc.org/wiki/spigot-installation/#mac-os-x
java -Xms512M -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot-*.jar
