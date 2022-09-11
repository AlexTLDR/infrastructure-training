1. create the docker network

docker network create goals-net

2. dockerizing the MongoDB service

docker run -d --name mongodb --network goals-net mongo

3. dockerizing the Node app

create the Dockerfile inside the backend folder and add the network details mongoose.connect -> mongodb://mongodb:27017/course-goals

docker build -t goals-node .

 docker run --name goals-backend --rm --network goal-net goals-node -> check if mongoose.connect is configured to use mongodb://mongodb before running the docker run command

