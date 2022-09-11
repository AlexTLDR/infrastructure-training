Run the below command for the named volume

docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback feedback-node:volumes

Run one of the below commands for the bind mount

docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "add the path of the project's folder keeping the quotes 
in oprder for the command not to break if you have whitespaces in the path" feedback-node:volumes

Short version for unix:
docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "$(pwd):/app" -v /app/node_modules feedback-node:volumes

Short version for windows:
docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "%cd%":/app -v /app/node_modules feedback-node:volumes 

In order to rebuild the feedback-node:volumes image, run this command -> docker build -t feedback-node:volumes .

For READ only:

docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "add the path of the project's folder keeping the quotes 
in oprder for the command not to break if you have whitespaces in the path:ro" -v /app/node_modules -v /app/temp feedback-node:volumes

for unix -> docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "$(pwd):/app:ro" -v /app/node_modules -v /app/temp feedback-node:volumes
for windows -> docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "%cd%":/app:ro -v /app/node_modules -v /app/temp feedback-node:volumes 
-add :ro at the container's external path

For Environment Variables & .env Files

for Variables -> docker run -d -p 3000:8000 --env PORT=8000 --rm --name feedback-app -v feedback:/app/feedback -v "$(pwd):/app:ro" -v /app/node_modules -v /app/temp feedback-node:env

for .env files -> docker run -d -p 3000:8000 --env-file ./.env --rm --name feedback-app -v feedback:/app/feedback -v "$(pwd):/app:ro" -v /app/node_modules -v /app/temp feedback-node:env
Summary:

docker run -v /app/data ...                 -> Anonymus volume
docker run -v data:/app/data ...            -> Named volume
docker run -v /path/to/code:/app/code ...   -> Bind Mount