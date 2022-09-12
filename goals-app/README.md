1. create the docker network

For BACKEND

docker network create goals-net

2. dockerizing the MongoDB service

docker run -d --name mongodb --network goals-net mongo

3. dockerizing the Node app

create the Dockerfile inside the backend folder and add the network details mongoose.connect -> mongodb://mongodb:27017/course-goals

docker build -t goals-node .

 docker run --name goals-backend -d --rm --network goals-net goals-node -> check if mongoose.connect is configured to use mongodb://mongodb before running the docker run command


For FRONTEND

1. create the docker file

2. docker build -t goals-react .

3. docker run --name goals-frontend --rm -d -p 3000:3000 -it goals-react
