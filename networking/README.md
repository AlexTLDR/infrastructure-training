Container to Container Communication

1. copy all the files
2. start the mongo db container -> docker run -d --name mongodb mongo
3. find the IP address of the mongo db containe -> docker container inspect mongodb
4. in the app.js file, replace the IP address with the one from your container under mongoose.connect -> 'mongodb://container's IP:27017/swfavorites'
5. run the app -> docker run --name favorites -d --rm -p 3000:3000 favorites-node

Postman API commands

1. GET localhost:3000/movies                            -> get all movies
2. POST localhost:3000/favorites -> Body->raw->JSON     -> post the favorite movie in the mongo db
{
    "name":"A New Hope",
    "type":"movie",
    "url":"http://swapi.dev/api/films/1/"
}
3. GET localhost:3000/favorites                         -> get the favorite movie/s from mongo db

Docker Networks

1. create the network -> docker network create favorites-net
2. optional, inspect the networks -> docker network ls
3. create the mongo container -> docker run -d --name mongodb --network favorites-net mongo
4. in the app.js file, change the mongoose.connect -> 'mongodb://the name of the container from the network:27017/swfavorites' -> 'mongodb://mongodb:27017/swfavorites'
5. build the container -> docker build -t favorites-node .
6. run the container in the new network -> docker run --name favorites -d --rm --network favorites-net favorites-node
