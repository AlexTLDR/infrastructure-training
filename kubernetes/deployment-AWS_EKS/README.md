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

Adding Worker Nodes

1. in the cluster, go to the compute tab and click on Add Node Group
2. give the node a name and configure an IAM role for it
3. open the IAM dashboard
4. go to roles -> create role
5. select EC2 and next
6. under policies search for eksworker and add the policy
7. the same add the cni, ec2containerreg (just the read only) policies and click on next
8. in the review page, give the role a name and click create role
9. go to the cluster page from step 1 and in the Node IAM role select the newly created role and click next
10. in the instance type select from t3.small to bigger (avoid the micro as it can return errors) -> next, next, create

Applying the Kubernetes Config

1. from the kubernetes folder run -> kubectl apply -f=auth.yaml -f=users.yaml
2. kubectl get services -> to get the URL of the users-service -> and test it with postman (end of the file)

Volumes

1. go to -> https://github.com/kubernetes-sigs/aws-efs-csi-driver
2. unsder installation, use the stable driver command -> kubectl apply -k "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.3" -> to install the driver
3. go to EC2 in aws console and create a new security group
4. give it a name and under VPC check that the eksVPC is selected (should be selected by default) 
5. inbound rules -> add rule -> and from vpc, select the ip of the network that was created and paste it in the source tab, custom and the ip (192.168.0.0/16)
6. click create security group 
7. open the efs page and click on create file system
8. give it a name and select the eks network and click on customize
9. in the security groups, remove the default ones and add the eks efs group that was just created
10. next, next and create
11. copy the file system id and add it in the users.yaml file as the volumeHandle

To test with postman

1. POST a9ebcd390a8dc4cbe9a88ade2cb47c58-585816499.eu-central-1.elb.amazonaws.com/signup
- under Body -> raw -> JSON

{
    "email": "test@test.com",
    "password": "secrettest"
}

- it should return something like:

{
    "message": "User created.",
    "user": {
        "_id": "6345c9f5bbcb27fc4cb530ce",
        "email": "test@test.com",
        "password": "$2a$12$BJIHA0JPKfDsKSS8aDn50.n9erLxZVoUqDjLkWUABqFrrKJAc4Ftu",
        "__v": 0
    }
}

2. POST a9ebcd390a8dc4cbe9a88ade2cb47c58-585816499.eu-central-1.elb.amazonaws.com/login
- under Body -> raw -> JSON

{
    "email": "test@test.com",
    "password": "secrettest"
}

- it should return something like:

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NjU1MTgyNzgsImV4cCI6MTY2NTUyMTg3OH0.12FcvPi7farRYUi5_HVvICFHx1EbtDlq80M6k7sNkmY",
    "userId": "6345c9f5bbcb27fc4cb530ce"
}