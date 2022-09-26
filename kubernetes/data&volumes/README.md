Check if any deployments are running:

1. kubectl get deployments
2. kubectl delete deploy <name of deployment>

In order to start the deployment:

1. minikube start
2. kubectl apply -f=service.yaml -f=deployment.yaml
3. kubectl get deployments (optional)
4. minikube service story-service

In order to use the Persistent Volume claim:

1. kubectl apply -f=host-pv.yaml
2. kubectl apply -f=host-pvc.yaml
3. kubectl apply -f=deployment.yaml
4. kubectl get pv 
5. kubectl get pvc
6. kubectl get deployments

For environment variables:

1. after modifying const filePath = path.join(__dirname, process.env.STORY_FOLDER, 'text.txt'); rebuild the image

docker build -t alextldr/k8s-data-demo:2 .

2. docker push alextldr/k8s-data-demo:2
3. kubectl apply -f=deployment.yaml

Using a config map (with the environment.yaml file):

1. kubectl apply -f=environment.yaml
2. kubectl get configmap -> to list all the config maps
3. kubectl apply -f=deployment.yaml