# Use the official PHP image as a base image
FROM php:8.1-apache

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the index.php file into the container
COPY index.php /var/www/html/

# Expose port 80 (default HTTP port)
EXPOSE 80