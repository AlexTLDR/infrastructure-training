Using the deployment.yaml and services.yaml files, commands to run:

1. kubectl apply -f=deployment.yaml 
2. kubectl apply -f service.yaml
3. minikube service backend -> to get the URL

Both yaml files can be combined into 1, in this case I named it master-deployment.yaml (any name can be assigned followed by the yaml extension)

1. kubectl apply -f=master-deployment.yaml
2. minikube service backend -> to get the URL

Optional commands:

1. kubectl get services
2. kubectl get pods
3. kubectl delete -f=<name of the deployment, like declarative-deployment> or
kubectl delete -f=deployment.yaml -> to use the yaml file (for multiple resource deletion, separate them with comma or space -f)
-> kubectl delete -f=deployment.yaml -f=service.yaml
