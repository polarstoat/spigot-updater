#!/usr/bin/env bash
#
# Starts the Spigot Minecraft server

# Change into server directory
cd "$(dirname "$0")"

# If build number file exists and its content is less than the latest successful build number
if [ -f ".buildNumber" ] && [ $(cat ".buildNumber") -lt $(curl -s https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/buildNumber) ]
then
	echo "There is a new Spigot build available, run update.command when you are ready to update"
fi

# Start server with Java options from
# https://www.spigotmc.org/wiki/spigot-installation/#mac-os-x
java -Xms512M -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot-*.jar
