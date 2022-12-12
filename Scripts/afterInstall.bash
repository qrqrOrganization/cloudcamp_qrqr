#!/bin/bash

sudo rsync --delete-before --verbose --archive /var/www/release/ /var/www/laravel-central-api/ > /var/log/deploy.log

cd /var/www/laravel-central-api
sudo composer install
sudo cp /var/www/release-files/.env /var/www/laravel-central-api
sudo cp /var/www/release-files/Controller.php /var/www/laravel-central-api/app/Http/Controllers
sudo php artisan key:generate
sudo php artisan config:cache
sudo chmod -R 775 storage bootstrap/cache storage/framework storage/logs
sudo chown -R $USER:www-data storage
sudo chown -R $USER:www-data bootstrap/cache
sudo pkill -9 -ef bot.php
nohup php bot.php > /dev/null 2> /dev/null < /dev/null &

if [ -d /home/ubuntu/code_pipeline_nginx ]; then
    sudo rm -rf /home/ubuntu/code_pipeline_nginx
fi