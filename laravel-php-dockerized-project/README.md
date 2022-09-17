Configuring Laravel

1. docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
2. in the .env file created by Laravel, modifi the mysql connection string:

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=homestead
DB_USERNAME=homestead
DB_PASSWORD=secret

Starting only the server, php and mysql services from the yaml file:

docker-compose up -d --build server -> only the server tag is required as the yaml file has the depends_on (php mysql) under the server services. Also use the --build so docker rebuilds the images, in case something changed

Artisan command

docker-compose run --rm artisan migrate