minikube start

Check if any deployments are running:

1. kubectl get deployments 
2. kubectl delete deploy <name of the running deployment>

What I did to prepare the docker images for the first deployment

1. from the users-api folder, run -> docker build -t alextldr/k8s-demo-users .
2. docker push alextldr/k8s-demo-users

For k8s I will add all the yaml files in the kubernetes folder

1. cd into the kubernetes folder and run -> kubectl apply -f=users-deployment.yaml
2. 
