Preparing the deployment 

1. on MongoDB Atlas, create a data base and a user with password to connect to this data base
2. use the string in this format and configure the users.yaml file with it in the environment value key -> mongodb+srv://<username>:<password>@cluster0.vnsuoup.mongodb.net/?retryWrites=true&w=majority (the user and pass that I used will be deleted)
3. create the dockerhub repos (I created alextldr/k8s-dep-users and alextldr/k8s-dep-auth)
4. cd into the users-api folder and run -> docker build -t alextldr/k8s-dep-users . -> docker push alextldr/k8s-dep-users
5. do the same with auth-api -> docker build -t alextldr/k8s-dep-auth . & docker push alextldr/k8s-dep-auth

On AWS:

Create the EKS cluster

1. in the cluster configuration add the name, the kubernetes version and create the role (if not already created) as EKS - Cluster 
2. add the role in the cluster config and click next

Configure the network

1. in services, search for CloudFormation and open it in a new tab
2. access https://docs.aws.amazon.com/eks/latest/userguide/creating-a-vpc.html#create-vpc and copy in the clipboard the link from point 5 and paste it in the Amazon S3 URL box
3. click next and give the stack a name (the rest leave as it is by default)
4. next, next until it reaches the create stack button and click it
5. go back to the cluster page and select the newly created vpc
6. in the Cluster endpoint access select Public and Private and then next, next and create

Change .kube config

1. in the /home/alex/.kube/ edit the config file as below, using the aws cli (install aws-cli if not installed)
2. configure aws-cli with the security credentials by opening the security credentials menu
3. create an access key and save it
4. run -> aws configure and follow the steps to add the access keys from the access key file
5. verify that the stack is created and after it is created,
6. run -> aws  eks --region eu-central-1 update-kubeconfig --name kub-dep-demo -> for updating the kubectl to use the correct region and stack instead of the local minikube

Added new context arn:aws:eks:eu-central-1:722527461667:cluster/kub-dep-demo to /home/alex/.kube/config

7. minikube delete -> to delete the minikube cluster

