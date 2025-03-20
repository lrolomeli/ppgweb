# Use an official lightweight Linux image with Nginx
FROM nginx:latest

# Remove default configuration and copy custom configs
COPY default /etc/nginx/sites-available/default
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 to allow external traffic
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
