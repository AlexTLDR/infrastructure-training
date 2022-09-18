For this method, I am using Amazon Elastic Container Service (ECS) (not free on AWS)

1. Search and open ECS
2. Selct the custom container (click on configure)
3. In the new menu, add the desired name and under image, add the image name from docker hub
 
 I will be using the same image pushed to docker hub from the manual deployment (check the README.md from there)

4. Map the port, in the Port mappings menu. In this case, port 80
5. Click on advanced and change the advanced configurations if necessary. For this image we don't use any volumes or mount points so nothing advanced is necessary
6. Click on update and then next
7. In the next menus configure what is necessary, for this example I use the default config
8. In the 4th step, click the create button

Run the application

1. After the instance is created, click on View Service
2. In the task tab, click on the task's name and get the public IP
3. Paste the public IP in the browser and the page will load

To update the application (after the code has been modified on your local machine)

1. docker build -t node-dep-example-1 .
2. docker tag node-dep-example-1 alextldr/aws-example-1
3. if not logged, log in to docker -> docker login
4. push the image to docker hub -> docker push alextldr/aws-example-1
5. in AWS go to clusters -> default -> task and create a new task revision and update service