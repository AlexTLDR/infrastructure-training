Run the below command for the named volume

docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback feedback-node:volumes

Run one of the below commands for the bind mount

docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "add the path of the project's folder keeping the quotes 
in oprder for the command not to break if you have whitespaces in the path" feedback-node:volumes

Short version for unix:
docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "$(pwd):/app" -v /app/node_modules feedback-node:volumes

Short version for windows:
docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "%cd%":/app -v /app/node_modules feedback-node:volumes 