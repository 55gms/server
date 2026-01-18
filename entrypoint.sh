#!/bin/bash

# Check if a custom backend server is set in the environment
if [ -n "$BACKEND_SERVER" ]; then
    echo "External BACKEND_SERVER detected: $BACKEND_SERVER"
    echo "Skipping internal 1.12.2 server startup."
    
    # Update BungeeCord config to point to the external server
    # This replaces 'address: localhost:25565' with your custom address
    sed -i "s/address: localhost:25565/address: $BACKEND_SERVER/g" /app/bungee/config.yml

else
    # ORIGINAL BEHAVIOR: Start the internal backend server
    echo "No BACKEND_SERVER env var found. Starting internal 1.12.2 Backend Server..."
    
    cd /app/server

    # Ensure EULA is accepted
    if [ ! -f eula.txt ]; then
        echo "eula=true" > eula.txt
    else
        grep -q "eula=true" eula.txt || echo "eula=true" > eula.txt
    fi

    # Start the server in the background
    java -Xmx1G -Xms1G -jar server.jar nogui &

    # Wait a bit for the server to initialize
    sleep 10
fi

# Start BungeeCord Proxy (Eaglercraft)
echo "Starting BungeeCord Proxy..."
cd /app/bungee
java -Xmx512M -Xms512M -jar bungee.jar
