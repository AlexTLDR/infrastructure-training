Preparing the deployment 

1. on MongoDB Atlas, create a data base and a user with password to connect to this data base
2. use the string in this format and configure the users.yaml file with it in the environment value key -> mongodb+srv://<username>:<password>@cluster0.vnsuoup.mongodb.net/?retryWrites=true&w=majority (the user and pass that I used will be deleted)
3. create the dockerhub repos (I created alextldr/k8s-dep-users and alextldr/k8s-dep-auth)
4. cd into the users-api folder and run -> docker build -t alextldr/k8s-dep-users . -> docker push alextldr/k8s-dep-users
5. do the same with auth-api -> docker build -t alextldr/k8s-dep-auth . & docker push alextldr/k8s-dep-auth
