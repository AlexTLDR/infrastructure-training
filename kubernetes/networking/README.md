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
4. try the APIs with Postman:
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

Users API - Auth API communication

1. cd into auth-api folder
2. docker build -t alextldr/k8s-demo-auth . -> also, I created on docker hub alextldr/k8s-demo-auth
3. docker push alextldr/k8s-demo-auth
4. from the users-api folder run docker build -t alextldr/k8s-demo-users .
5. docker push alextldr/k8s-demo-users -> steps 4 and 5 are needed so that the latest image is used with the updated source code
6. cd into the kubernetes folder and run kubectl apply -f=users-deployment.yaml -> to integrate the last updates
7. try the APIs with Postman:
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

Creating Multiple Deployments

