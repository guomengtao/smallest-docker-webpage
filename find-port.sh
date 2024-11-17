#!/bin/bash
# Function to check if a port is in use
is_port_used() {
    lsof -i :$1 >/dev/null 2>&1
    return $?
}

# Start checking from port 8080
port=8080
# Keep incrementing until we find an unused port
while is_port_used $port; do
    port=$((port + 1))
done

# Create or update .env file with the found port
cat > .env << EOF
# Auto-generated port: $port (found first unused port starting from 8080)
DOCKER_PROJECT_NAME=$(basename $(pwd))
PORT=$port
DOMAIN=$(basename $(pwd)).1panel.rinuo.com
EMAIL=guomengtao@gmail.com
EOF

echo "Found unused port: $port" 