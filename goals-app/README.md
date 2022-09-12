For BACKEND

1. create the docker network

docker network create goals-net

2. dockerizing the MongoDB service

docker run --rm -d --name mongodb -v data:/data/db --network goals-net -e MONGO_INITDB_ROOT_USERNAME=alex -e MONGO_INITDB_ROOT_PASSWORD=secret mongo

3. dockerizing the Node app

create the Dockerfile inside the backend folder and add the network details mongoose.connect -> mongodb://alex:secret@mongodb:27017/course-goals?authSource=admin -> add also the user and password for the mongo db connection

docker build -t goals-node .

 docker run --name goals-backend -d --rm -p 80:80 --network goals-net goals-node -> check if mongoose.connect is configured to use mongodb://alex:secret@mongodb:27017/course-goals?authSource=admin before running the docker run command

 if any MongoDB auth issues, use docker volume prune to remove all unused volumes which mai affect the new credentials


For FRONTEND

1. create the docker file

2. docker build -t goals-react .  -> to rebuild the image with the correct docker network configured

3. docker run --name goals-frontend --rm -d --network goals-net -p 3000:3000 -it goals-react
