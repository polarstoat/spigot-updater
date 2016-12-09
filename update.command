#!/usr/bin/env bash
#
# Downloads and builds a Spigot Minecraft server, overwriting any
# existing Spigot Minecraft server

# Handle unrecoverable (fatal) errors
function fatal_error {
  echo "$1" >&2
  exit 1
}

# Path to the server
SERVER_DIR="$(dirname "$0")"
# Path to a temporary directory to build inside of
BUILD_DIR="$(mktemp -dt spigot-updater)"

# Delete temporary directory on exit
trap "rm -rf "${BUILD_DIR}"" EXIT

# Change into temporary directory
cd "${BUILD_DIR}"

# Download latest BuildTools
echo 'Downloading BuildTools'
curl -#O https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar || fatal_error 'Download failed'
echo 'Download complete'

# Run BuildTools
echo 'Building Spigot (this will take a while)'
java -Xmx2G -jar BuildTools.jar > /dev/null 2>&1 || fatal_error 'Build failed'
echo 'Build complete'

# Delete old Spigot jar
rm -f "${SERVER_DIR}"/spigot-*.jar

# Copy built Spigot jar into server directory
cp -f spigot-*.jar "${SERVER_DIR}"

echo 'Spigot updated!'
