#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Install Nginx if not already installed
if ! command -v nginx &> /dev/null; then
    echo "Installing Nginx..."
    sudo apt update
    sudo apt install -y nginx
else
    echo "Nginx is already installed."
fi

# Backup existing configuration files
echo "Backing up existing configuration files..."
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

# Copy new configuration files from the current directory
echo "Replacing Nginx configuration files..."
sudo cp default /etc/nginx/sites-available/default
sudo cp nginx.conf /etc/nginx/nginx.conf

# Reload Nginx to apply changes
echo "Restarting Nginx..."
sudo systemctl restart nginx

echo "Nginx installation and configuration complete!"
