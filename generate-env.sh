#!/bin/bash

# Get the current directory name as default project name
DEFAULT_PROJECT_NAME=$(basename $(pwd))
DEFAULT_DOMAIN="${DEFAULT_PROJECT_NAME}.1panel.rinuo.com"

# Create .env file with default values
cat > .env << EOF
# Project configuration
PROJECT_NAME=${DEFAULT_PROJECT_NAME}
DOMAIN=${DEFAULT_DOMAIN}

# Other settings
PORT=8086
EMAIL=guomengtao@gmail.com
EOF

echo "Generated .env file with:"
echo "PROJECT_NAME=${DEFAULT_PROJECT_NAME}"
echo "DOMAIN=${DEFAULT_DOMAIN}"
echo ""
echo "You can edit .env to change these values if needed." 