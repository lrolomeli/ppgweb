# Use an official lightweight Linux image with Nginx
FROM nginx:latest

# Remove default configuration and copy custom configs
COPY default /etc/nginx/sites-available/default
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 to allow external traffic
EXPOSE 80

# Install CIFS utilities
RUN apt update && apt install -y cifs-utils

# Create a mount point
RUN mkdir -p /mnt/share

RUN echo "//192.168.1.178/share /mnt/share cifs vers=2.0 0 0" >> /etc/fstab

CMD ["nginx", "-g", "daemon off;"]