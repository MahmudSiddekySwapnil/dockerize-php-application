# Use official PHP image as base
FROM php:8.3-fpm

# Install dependencies
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Set working directory
WORKDIR /var/www

# Copy the current directory (.) into /var/www in the container
COPY . /var/www

# Set file permissions
RUN chown -R www-data:www-data /var/www


