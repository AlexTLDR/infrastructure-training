Commands

1. to start execution in as running container:

docker exec -it  <name of the container> init

Use of the Dockerfile:

1. docker build -t node-util .

Commands inside the running container:

1. docker run -it node-util npm init -> running the command in the WORKDIR /app
2. docker run -it -v "$(pwd):/app" node-util npm init -> mirroring the command in both WORKDIR /app in the container and also locally (will create the package.json file locally)

For the ENTRYPOINT:

1. docker build -t mynpm . -> build the image
2. docker run -it -v "$(pwd):/app" mynpm init 
3. then any command can be run like -> docker run -it -v "$(pwd):/app" mynpm install -> and all will be installed accordingly to the json file created at step 2
4. docker run -it -v "$(pwd):/app" mynpm install express --save -> to add a dependency that is not mentioned in the json file

Using docker compose

1. docker-compose run npm init -> to run from the ENTRYPOINT in the Dockerfile and init as the command to run
2. docker-compose run --rm npm init -> the same from stem 1 but with the removal of the container after the command finishes 