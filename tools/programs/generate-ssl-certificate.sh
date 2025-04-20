#!/bin/bash
echo -e "Reloading the SSL certificates...\n"

# Ensure the directory exists before generating certificates
mkdir -p docker/nginx/ssl

# Generate the SSL certificates
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
     -keyout docker/nginx/ssl/app.key \
     -out docker/nginx/ssl/app.crt \
     -subj "/C=FR/ST=France/L=Paris/O=Project Name/OU=IT Department/CN=host"

echo -e "SSL certificates generated successfully!\n"