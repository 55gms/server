#!/bin/bash


# Start BungeeCord Proxy (Eaglercraft)
echo "Starting BungeeCord Proxy..."
cd /app/bungee
java -Xmx512M -Xms512M -jar bungee.jar
