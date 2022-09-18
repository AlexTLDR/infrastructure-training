1. install kubectl -> https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
2. install minikube -> https://minikube.sigs.k8s.io/docs/start/

Commands to run:

1. docker build -t kub-first-app .
2. minikube status -> if not up and running, start it with -> minikube start 
3. in docker hub, create the image repository -> alextldr/k8s-first-app
4. docker tag kub-first-app alextldr/k8s-first-app
5. docker push alextldr/k8s-first-app
6. kubectl create deployment first-app --image=alextldr/k8s-first-app
7. kubectl get deployments -> to check if the deployment is created 
8. kubectl get pods -> to check the pods
9. minikube dashboard -> to open the dashboard in the browser