Without Docker Compose

For BACKEND

1. create the docker network

docker network create goals-net

2. dockerizing the MongoDB service

docker run --rm -d --name mongodb -v data:/data/db --network goals-net -e MONGO_INITDB_ROOT_USERNAME=alex -e MONGO_INITDB_ROOT_PASSWORD=secret mongo

3. dockerizing the Node app

create the Dockerfile inside the backend folder and add the network details mongoose.connect -> mongodb://alex:secret@mongodb:27017/course-goals?authSource=admin -> add also the user and password for the mongo db connection

docker build -t goals-node .

 docker run --name goals-backend -d -v "$(pwd):/app" -v logs:/app/logs -v /app/node_modules -e MONGODB_USERNAME=alex -e MONGODB_PASSWORD=secret --rm -p 80:80 --network goals-net goals-node -> check if mongoose.connect is configured to use mongodb://alex:secret@mongodb:27017/course-goals?authSource=admin before running the docker run command

 if any MongoDB auth issues, use docker volume prune to remove all unused volumes which mai affect the new credentials


For FRONTEND

1. create the docker file

2. docker build -t goals-react .  -> to rebuild the image with the correct docker network configured

3. docker run -v "$(pwd)/src:/app/src" --name goals-frontend --rm --network goals-net -p 3000:3000 -it goals-react -> replace -it -d to run in detach mode

With Docker Compose

docker-compose up -> to start in attached mode
docker-compose up -d -> to start in detach mode

docker compose down -> to stop it, without removing the volumes
docker compose down -v to stop it and remove the volumes

* If the below error is received, in ~/.docker/config.json change credsStore to credStore. More details -> https://forums.docker.com/t/docker-credential-desktop-exe-executable-file-not-found-in-path-using-wsl2/100225/3

error getting credentials - err: docker-credential-desktop resolves to executable in current directory (./docker-credential-desktop), out: ``