minikube start

Check if any deployments are running:

1. kubectl get deployments 
2. kubectl delete deploy <name of the running deployment>
3. kubectl get service
4. kubectl delete service <name of the service/s>

What I did to prepare the docker images for the first deployment

1. from the users-api folder, run -> docker build -t alextldr/k8s-demo-users .
2. docker push alextldr/k8s-demo-users -> after alextldr/k8s-demo-users is created on docker hub

For k8s I will add all the yaml files in the kubernetes folder

1. cd into the kubernetes folder and run -> kubectl apply -f=users-deployment.yaml
2. kubectl apply -f=users-service.yaml
3. minikube service users-service
4. test the APIs (last part of the readme)

Users API - Auth API communication

1. cd into auth-api folder
2. docker build -t alextldr/k8s-demo-auth . -> also, I created on docker hub alextldr/k8s-demo-auth
3. docker push alextldr/k8s-demo-auth
4. from the users-api folder run docker build -t alextldr/k8s-demo-users .
5. docker push alextldr/k8s-demo-users -> steps 4 and 5 are needed so that the latest image is used with the updated source code
6. cd into the kubernetes folder and run kubectl apply -f=users-deployment.yaml -> to integrate the last updates
7. test the APIs (last part of the readme)

Creating Multiple Deployments

1. from the kubernetes folder run -> kubectl apply -f=auth-service.yaml -f=auth-deployment.yaml
2. kubectl get services -> to see the IP address of the auth-service
3. in the users-deployment.yaml file, change the localhost variable with the IP address from step 2 as a value for AUTH_ADDRESS
4. kubectl apply -f=users-deployment.yaml
5. for not using the IP manually I have changed the environment variable in the users-app.js file and now I am using the users-deployment.yaml file
6. from the users-api folder, run docker build -t alextldr/k8s-demo-users .
7. push the new image to docker hub -> docker push alextldr/k8s-demo-users
8. from the kubernetes folder run -> kubectl delete -f=users-deployment.yaml
9. kubectl apply -f=users-deployment.yaml
10. test the APIs (last part of the readme)

Using DNS for Pod to Pod Communication

1. kubectl get namespaces -> 
NAME              STATUS   AGE
default           Active   15d
kube-node-lease   Active   15d
kube-public       Active   15d
kube-system       Active   15d
2. in the users-deployment.yaml file, edit the environment value to -> value: "auth-service.default" -> as we are using the default name space
3. kubectl apply -f=users-deployment.yaml
4. test the APIs (last part of the readme)

Connecting the tasks-api

1. created the task-deployment and task-service yaml files
2. create the alextldr/k8s-demo-tasks on docker hub
3. cd into the tasks-api folder and run -> docker build -t alextldr/k8s-demo-tasks .
4. docker push alextldr/k8s-demo-tasks
5. cd into the kubernetes folder and run -> kubectl apply -f=tasks-service.yaml -f=tasks-deployment.yaml
6. for testing -> minikube service tasks-service -> andf in postman:
- GET http://address provided by minikube service/tasks
- under headers add key Authorization and value Bearer abc
- at first, this will be returned:
{
    "message": "Loading the tasks failed."
}
- fix it by posting http://address provided by minikube service/tasks
{
    "text": "First task",
    "title": "To do this!"
}

TEST the APIs with Postman:
- copy the URL from minikube
- post the URL/login with the below Body as JSON

{
    "email": "test@test.de",
    "password": "testers"
}

- after clicking send, a tocken should be returned

{
    "token": "abc"
}

- change to URL/signup and post and the user created message will be retrieved

{
    "message": "User created!"
}