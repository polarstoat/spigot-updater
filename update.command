#!/usr/bin/env bash
#
# Downloads and builds a Spigot Minecraft server, overwriting any
# existing Spigot Minecraft server

# Handle unrecoverable (fatal) errors
function fatal_error {
  echo "$1" >&2
  exit 1
}

# Path to the server, see http://stackoverflow.com/a/246128
SERVER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Path to the build number file
BUILD_NUM_FILE="${SERVER_DIR}/.buildNumber"

# If build number file exists and its content is equal to the latest successful build number
if [ -f "${BUILD_NUM_FILE}" ] && [ $(cat "${BUILD_NUM_FILE}") -eq $(curl -s https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/buildNumber) ]
then
	read -p "You already have the latest build of Spigot, do you want to force the update anyway? [Y/n]" -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		echo "No update will be made"
		exit 0
	fi
fi

# Path to a temporary directory to build inside of
BUILD_DIR="$(mktemp -dt spigot-updater)"

# Delete temporary directory on exit
trap "rm -rf "${BUILD_DIR}"" EXIT

# Change into temporary directory
cd "${BUILD_DIR}"

# Download latest BuildTools
echo 'Downloading BuildTools'
curl -#O https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar || fatal_error 'Download failed'
curl -so "${BUILD_NUM_FILE}" https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/buildNumber
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
