# Smallest Docker Webpage

[![Version](https://img.shields.io/github/v/tag/guomengtao/smallest-docker-webpage)](https://github.com/guomengtao/smallest-docker-webpage/tags)

A minimal Docker webpage setup with Traefik reverse proxy and HTTPS support.

## Version History

- v1.0.0: Initial release with automatic SSL certification
  - Traefik reverse proxy integration
  - Automatic HTTPS/SSL certification
  - Multi-project support
  - Detailed documentation

## Prerequisites

1. Global Traefik Setup (if not already running):
   ```bash
   # Create and enter global Traefik directory
   mkdir ~/traefik-proxy && cd ~/traefik-proxy
   
   # Copy Traefik configuration files
   curl -O https://raw.githubusercontent.com/guomengtao/smallest-docker-webpage/main/traefik-compose.yml
   curl -O https://raw.githubusercontent.com/guomengtao/smallest-docker-webpage/main/traefik.yml
   
   # Create network and certificate storage
   docker network create traefik_public
   touch acme.json && chmod 600 acme.json
   
   # Create .env file for Traefik
   echo "EMAIL=your-email@example.com" > .env
   
   # Start global Traefik
   docker-compose -f traefik-compose.yml up -d
   ```

## Project Structure
```
~/traefik-proxy/           # Global Traefik directory
├── traefik-compose.yml    # Global Traefik compose file
├── traefik.yml           # Global Traefik configuration
├── acme.json             # SSL certificates storage
└── .env                  # Global Traefik environment

./your-project/           # Your project directory
├── docker-compose.yml    # Project compose file
├── .env                 # Project environment
└── app/                 # Project files
    └── index.html
```

## Quick Start

1. Clone this repository
2. Configure your `.env` file:
   ```bash
   DOCKER_PROJECT_NAME=$(basename $(pwd))
   DOMAIN=your-new-domain.com
   EMAIL=your-email@example.com
   ```
3. Start the web application:
   ```bash
   docker-compose up -d
   ```

## Important Notes

### SSL Certificates
- This project uses a shared Traefik instance for SSL certificates
- No need to restart Traefik when adding new projects
- Each project automatically gets SSL if properly configured
- All certificates are stored in the global `acme.json` file

### Required Configuration
Your docker-compose.yml must include these labels for automatic SSL:
```yaml
labels:
  - "traefik.enable=true"
  - "traefik.http.routers.${DOCKER_PROJECT_NAME}.rule=Host(`${DOMAIN}`)"
  - "traefik.http.routers.${DOCKER_PROJECT_NAME}.tls=true"
  - "traefik.http.services.${DOCKER_PROJECT_NAME}.loadbalancer.server.port=80"
```

[中文文档](README_CN.md)