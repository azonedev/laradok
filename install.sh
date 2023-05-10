echo "Coping docker-compose.yml.example to docker-compose.yml"
cp docker-compose.yml.example docker-compose.yml

echo "Coping .env.example to .env"
cp .env.example .env

#laravel app
echo "Cloning latest version of laravel"
git clone https://github.com/laravel/laravel.git app
cp app/.env.example app/.env

#docker 
#up containers
echo "Starting containers"
docker-compose up -d

#laravel app permissions
echo "Setting laravel app permissions"
sudo chmod -R 777 app/storage
sudo chmod -R 777 app/bootstrap/cache

#laravel dependencies
echo "Installing laravel dependencies"
docker-compose exec laradok_worker composer install --prefer-source 
echo "Generating laravel key"
docker-compose exec laradok_app php artisan key:generate 

#up containers
echo "Re-start containers"
docker-compose restart
