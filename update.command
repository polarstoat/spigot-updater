#!/bin/bash
#
# Downloads and builds a Spigot Minecraft server, overwriting any
# existing Spigot Minecraft server

# Path to the server
SERVER_DIR="$(dirname "$0")"
# Path to a temporary directory to build inside of
BUILD_DIR="$(mktemp -dt spigot-updater)"

# Delete temporary directory on exit
trap "rm -rf "${BUILD_DIR}"" EXIT

# Change into temporary directory
cd "${BUILD_DIR}"

# Download latest BuildTools.jar, but exit if it fails
curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar || exit 1

# Run the BuildTools jar, but exit if it fails (e.g. if user has no Java)
java -Xmx2G -jar BuildTools.jar || exit 1

# Copy built Spigot jar into server directory
cp -f spigot-*.jar "${SERVER_DIR}"
