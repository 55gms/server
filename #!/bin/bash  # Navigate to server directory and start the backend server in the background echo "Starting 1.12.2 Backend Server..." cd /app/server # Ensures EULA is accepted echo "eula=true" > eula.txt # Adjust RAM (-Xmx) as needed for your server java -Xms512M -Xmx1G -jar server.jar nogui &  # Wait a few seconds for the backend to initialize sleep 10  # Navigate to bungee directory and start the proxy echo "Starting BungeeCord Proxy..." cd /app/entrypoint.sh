#!/bin/bash

# Navigate to server directory and start the backend server in the background
echo "Starting 1.12.2 Backend Server..."
cd /app/server
# Ensures EULA is accepted
echo "eula=true" > eula.txt
# Adjust RAM (-Xmx) as needed for your server
java -Xms512M -Xmx1G -jar server.jar nogui &

# Wait a few seconds for the backend to initialize
sleep 10

# Navigate to bungee directory and start the proxy
echo "Starting BungeeCord Proxy..."
cd /app/bungee
java -Xms512M -Xmx512M -jar bungee.jar
