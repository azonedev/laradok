#!/bin/sh
set -e

php-fpm

# chown -R www-data:www-data /var/www/app/storage/


#php /var/www/core/artisan queue:work

