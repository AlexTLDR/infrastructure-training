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

Updating Deployments

1. update the source code
2. docker build -t alextldr/k8s-first-app:2 .  -> give a tag to the build command, like the version
3. docker push alextldr/k8s-first-app:2
4. kubectl set image deployment/first-app k8s-first-app=alextldr/k8s-first-app:2
5. kubectl rollout status deployment/first-app

Deployment Rollback & History

1. Create a brocken update -> kubectl set image deployment/first-app k8s-first-app=alextldr/k8s-first-app:3  (using version 3 in the tag, which doesn't exist)
2. kubectl rollout status deployment/first-app  -> I am stuck in a loop, exit with ctr+c
3. kubectl get pods -> to see the stuck pod

NAME                         READY   STATUS         RESTARTS   AGE
first-app-6574bc56d6-j9glg   0/1     ErrImagePull   0          66s
first-app-6c698d97d5-9dccm   1/1     Running        0          7m55s

4. kubectl rollout undo deployment/first-app    -> to undo the latest deployment
5.  kubectl get pods                            -> the "problematic" pod is gone

NAME                         READY   STATUS    RESTARTS   AGE
first-app-6c698d97d5-9dccm   1/1     Running   0          10m

To go back to an even older deployment

1. kubectl rollout history deployment/first-app

deployment.apps/first-app 
REVISION  CHANGE-CAUSE
1         <none>
3         <none>
4         <none>

2. kubectl rollout history deployment/first-app --revision=3 -> we can see the image version, in this case the brocHello from this NodeJS app!!!!!!
<>This is new for updating purpose!!!!!
Try sending a request to /error and see what happensken image

deployment.apps/first-app with revision #3
Pod Template:
  Labels:       app=first-app
        pod-template-hash=6574bc56d6
  Containers:
   k8s-first-app:
    Image:      alextldr/k8s-first-app:3
    Port:       <none>
    Host Port:  <none>
    Environment:        <none>
    Mounts:     <none>
  Volumes:      <none>

3. kubectl rollout undo deployment/first-app --to-revision=1  -> to go back to revision 1

Cleanup:

1. kubectl delete service first-app
2. kubectl delete deployment first-app