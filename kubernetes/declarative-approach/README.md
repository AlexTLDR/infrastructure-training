Commands to run:

1. kubectl apply -f=deployment.yaml 
2. kubectl apply -f service.yaml
3. minikube service backend -> to get the URL

Optional commands:

1. kubectl get services
2. kubectl get pods
3. kubectl delete deployment <name of the deployment, like declarative-deployment> or
kubectl delete -f=deployment.yaml -> to use the yaml file (for multiple resource deletion, separate them with comma)

