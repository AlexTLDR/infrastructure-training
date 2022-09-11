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

