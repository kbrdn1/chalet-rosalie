FROM oven/bun AS frontend-build

# Set working directory
WORKDIR /var/www/chalet-rosalie

# Install system dependencies
COPY package.json bun.lock ./
COPY vite.config.ts vite.config.ts
COPY tsconfig.json tsconfig.json
COPY components.json components.json
COPY eslint.config.js eslint.config.js
COPY vendor/tightenco/ziggy ./vendor/tightenco/ziggy
COPY vendor/laravel/framework/src/Illuminate/Pagination/resources/views ./vendor/laravel/framework/src/Illuminate/Pagination/resources/views
COPY storage/framework/views ./storage/framework/views
COPY resources/assets ./resources/assets
COPY resources/js ./resources/js
COPY resources/css ./resources/css
COPY resources/views ./resources/views
# COPY resources/lang ./resources/lang

# Install Bun
RUN bun install --frozen-lockfile

# Build assets
RUN bun run build:ssr

FROM php:8.4-fpm

# Set working directory
WORKDIR /var/www/chalet-rosalie

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    inotify-tools \
    netcat-openbsd \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install \
    pdo_mysql \
    mbstring \
    exif \
    pcntl \
    bcmath \
    gd

# Install Redis extension
# RUN pecl install redis && docker-php-ext-enable redis

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install MinIO Client
# RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc && \
#     chmod +x mc && \
#     mv mc /usr/local/bin/mc

# Add user for Laravel application
RUN useradd -ms /bin/bash -u 1000 sail

# Ensure proper directory permissions
RUN mkdir -p /var/www/chalet-rosalie && chown -R sail:sail /var/www/chalet-rosalie

# Set PHP memory limit to 512M and upload limit to 256M
RUN echo "memory_limit=512M" > /usr/local/etc/php/conf.d/memory-limit.ini
RUN echo "upload_max_filesize=256M" > /usr/local/etc/php/conf.d/upload-limit.ini

# Copy application code to container
COPY app /var/www/chalet-rosalie/app
COPY bootstrap /var/www/chalet-rosalie/bootstrap
COPY config /var/www/chalet-rosalie/config
COPY database /var/www/chalet-rosalie/database
# COPY lang /var/www/chalet-rosalie/lang
COPY public /var/www/chalet-rosalie/public
COPY resources /var/www/chalet-rosalie/resources
COPY routes /var/www/chalet-rosalie/routes
COPY storage /var/www/chalet-rosalie/storage
COPY tests /var/www/chalet-rosalie/tests
COPY artisan /var/www/chalet-rosalie/artisan
COPY composer.json /var/www/chalet-rosalie/composer.json
COPY .env /var/www/chalet-rosalie/.env
COPY phpunit.xml /var/www/chalet-rosalie/phpunit.xml
COPY composer.lock /var/www/chalet-rosalie/composer.lock
COPY composer.json /var/www/chalet-rosalie/composer.json

# Copy built assets to the public directory
COPY --from=frontend-build /var/www/chalet-rosalie/public/build ./public/build

RUN chown -R sail:sail /var/www/chalet-rosalie

# Install PHP dependencies
USER sail
RUN composer install --no-ansi --no-interaction --no-progress --no-scripts --optimize-autoloader

# Expose port 8000 and start script
EXPOSE 8000

# Copy start script
COPY tools/local/ /usr/local/bin/

# Copy minio policy
# RUN mkdir -p /home/sail/minio
# COPY docker/minio/policy.json /home/sail/minio/policy.json

# Switch back to root to set permissions for start and minio setup scripts
USER root

# RUN chown -R sail:sail /home/sail/minio
# RUN chmod +x /home/sail/minio/policy.json
# RUN chmod +x /usr/local/bin/minio_setup.sh
RUN chmod +x /usr/local/bin/start.sh

# Switch back to sail user for running the application
USER sail

# Start script
CMD ["/usr/local/bin/start.sh"]