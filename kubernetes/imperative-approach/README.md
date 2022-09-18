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

Create the service so the pod is accessible (exposed):

1. kubectl expose deployment first-app --type=LoadBalancer --port=8080 
2. kubectl get services -> since it is a local deployment, it can be seen that no accessible IP is present under external ip
3. minikube service first-app -> we get the URL and usually a popup in the browser with the URL

Scaling

1. kubectl scale deployment/first-app --replicas=3
2. kubectl get pods -> 3 pods will be listed 

NAME                         READY   STATUS    RESTARTS       AGE
first-app-686c9dcf97-6gpjg   1/1     Running   0              14s
first-app-686c9dcf97-pgmxv   1/1     Running   4 (4m5s ago)   29m
first-app-686c9dcf97-vmj9r   1/1     Running   0              14s

3. kubectl scale deployment/first-app --replicas=1 -> to scale back to 1