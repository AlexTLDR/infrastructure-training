Check if any deployments are running:

1. kubectl get deployments
2. kubectl delete deploy <name of deployment>

In order to start the deployment:

1. minikube start
2. kubectl apply -f=service.yaml -f=deployment.yaml
3. kubectl get deployments (optional)
4. minikube service story-service

