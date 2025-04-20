#!/bin/bash
set -e  # Exit on error

# Check if the .env file exists and copy it from the example file if it doesn't
if [ ! -f /var/www/chalet-rosalie/.env ]; then
  cp /var/www/chalet-rosalie/.env.example /var/www/chalet-rosalie/.env
fi

echo -e "Starting the application...\n"

# Store environment variables in local variables with defaults
DB_HOST_VAL=${DB_HOST:-mysql-rosalie}
# REDIS_HOST_VAL=${REDIS_HOST:-redis-rosalie}
# MINIO_HOST_VAL=${MINIO_HOST:-minio-rosalie}
# APP_FRONTEND_URL_VAL=${APP_FRONTEND_URL:-http://localhost:3000}
# MINIO_ACCESS_KEY_VAL=${MINIO_ACCESS_KEY:-sail-access-key}
# MINIO_SECRET_KEY_VAL=${MINIO_SECRET_KEY:-minio123}
# MINIO_ROOT_USER_VAL=${MINIO_ROOT_USER:-minioadmin}
# MINIO_ROOT_PASSWORD_VAL=${MINIO_ROOT_PASSWORD:-minioadmin}
# MINIO_BUCKET_VAL=${MINIO_BUCKET:-chalet-rosalie}

# Print environment variables if APP_DEBUG is true
if [ "${APP_DEBUG}" = "true" ]; then
  echo "Environment Variables:"
  echo "DB_HOST = ${DB_HOST_VAL}"
  # echo "REDIS_HOST = ${REDIS_HOST_VAL}"
  # echo "MINIO_HOST = ${MINIO_HOST_VAL}"
  # echo "APP_FRONTEND_URL = ${APP_FRONTEND_URL_VAL}"
  # echo "MINIO_ACCESS_KEY = ${MINIO_ACCESS_KEY_VAL}"
  # echo "MINIO_SECRET_KEY = ${MINIO_SECRET_KEY_VAL}"
  # echo "MINIO_ROOT_USER = ${MINIO_ROOT_USER_VAL}"
  # echo "MINIO_ROOT_PASSWORD = ${MINIO_ROOT_PASSWORD_VAL}"
  # echo "MINIO_BUCKET = ${MINIO_BUCKET_VAL}"
  echo -e "\n"
fi

# Set the environment variables
if [ -f /var/www/chalet-rosalie/.env ]; then
  # Use -E for extended regex compatibility in all platforms
  sed -i -E "s|DB_HOST=.*|DB_HOST=${DB_HOST_VAL}|g" /var/www/chalet-rosalie/.env
  # sed -i -E "s|REDIS_HOST=.*|REDIS_HOST=${REDIS_HOST_VAL}|g" /var/www/chalet-rosalie/.env
  # sed -i -E "s|MINIO_HOST=.*|MINIO_HOST=${MINIO_HOST_VAL}|g" /var/www/chalet-rosalie/.env
  # sed -i -E "s|APP_FRONTEND_URL=.*|APP_FRONTEND_URL=${APP_FRONTEND_URL_VAL}|g" /var/www/chalet-rosalie/.env
  # sed -i -E "s|AWS_ACCESS_KEY_ID=.*|AWS_ACCESS_KEY_ID=${MINIO_ACCESS_KEY_VAL}|g" /var/www/chalet-rosalie/.env
  # sed -i -E "s|AWS_SECRET_ACCESS_KEY=.*|AWS_SECRET_ACCESS_KEY=${MINIO_SECRET_KEY_VAL}|g" /var/www/chalet-rosalie/.env
  # sed -i -E "s|MINIO_ROOT_USER=.*|MINIO_ROOT_USER=${MINIO_ROOT_USER_VAL}|g" /var/www/chalet-rosalie/.env
  # sed -i -E "s|MINIO_ROOT_PASSWORD=.*|MINIO_ROOT_PASSWORD=${MINIO_ROOT_PASSWORD_VAL}|g" /var/www/chalet-rosalie/.env
  # sed -i -E "s|MINIO_BUCKET=.*|MINIO_BUCKET=${MINIO_BUCKET_VAL}|g" /var/www/chalet-rosalie/.env
  sed -i -E "s|APP_DEBUG=.*|APP_DEBUG=${APP_DEBUG}|g" /var/www/chalet-rosalie/.env
  sed -i -E "s|127.0.0.1:8000|0.0.0.0:8000|g" /var/www/chalet-rosalie/.env
else
  echo "Warning: .env file not found at /var/www/chalet-rosalie/.env"
fi

# Generate the application key
php artisan key:generate

# Wait for the MySQL database to be available
until nc -z -v -w30 ${DB_HOST_VAL} 3306
do
  echo "Waiting for MySQL database..."
  sleep 1
done

# # Wait for Redis to be available
# until nc -z -v -w30 ${REDIS_HOST_VAL} 6379
# do
#   echo "Waiting for Redis..."
#   sleep 1
# done

# # Wait for MinIO to be available
# until nc -z -v -w30 ${MINIO_HOST_VAL} 9000
# do
#   echo "Waiting for MinIO..."
#   sleep 1
# done

echo -e "All services are ready. Starting the application...\n"

# Run minio_setup.sh
# sh /usr/local/bin/minio_setup.sh

# Run migrations, seed the database and cache the configuration
php artisan config:clear
php artisan migrate:fresh --seed --force
php artisan optimize

# Start application
php artisan serve --host=0.0.0.0 --port=8000