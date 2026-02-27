# Use Eclipse Temurin Java 8 (Official, Supports ARM64/aarch64)
FROM eclipse-temurin:8-jre

# Set working directory
WORKDIR /app

# Copy the server and bungee folders from your repo into the container
COPY server/ /app/server/
COPY bungee/ /app/bungee/

# Copy the entrypoint script we created above
COPY entrypoint.sh /app/entrypoint.sh

# Make the script executable
RUN chmod +x /app/entrypoint.sh

# Expose necessary ports:
# 8081  - Eaglercraft WebSocket (defined in listeners.yml)
# 25577 - BungeeCord Standard Port
EXPOSE 8081 25577

# Start the server
CMD ["/app/entrypoint.sh"]
