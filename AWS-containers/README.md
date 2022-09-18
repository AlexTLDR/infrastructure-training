Local deployment:

1. docker build -t node-dep-example .
2. docker run -d --rm --name node-dep -p 80:80 node-dep-example 

AWS deployment:

1. Search for EC2 -> go to dashboard
2. Launch new instance
3. Follow the steps (select Linux instance, AWS most common and use the default settings -> for free version select instance type t2micro)
4. Click launch and then create a new key pair, for ssh 
5. Download the key pair (if it is lost, AWS will not generate a new one so the virtual machine will need to be deleted)
6. Launch instance
7. On the connect tab,select ssh client and you will have all the info required to ssh into the new machine

On the AWS machine (since I used AWS linux, I will use the yum package manager):

1. update the os -> sudo yum update -y
2. install docker -> sudo amazon-linux-extras install docker
3. start docker -> sudo service docker start

Move the project to AWS

1. login to docker hub 
2. create a new repository 
3. optionally, depending on the case, create/use a .dockerignore file, as in this example
4. on the local machine build the image to be uploaded in the new repository -> docker build -t node-dep-example-1 .
5. change the name of the image to the name from the repository (alextldr/aws-example-1 from the command) -> the docker tag node-dep-example-1 alextldr/aws-example-1 
6. if not logged, log in to docker -> docker login
7. push the image to docker hub -> docker push alextldr/aws-example-1
8. from the AWS ssh, run the image -> docker run -d --rm -p 80:80 alextldr/aws-example-1 (if an error is encountered, use sudo)
9. from AWS, select security groups, the last one created, something like launch-wizard- , open the group, navigate to inbound and add http access (default only ssh access is enabled)
10. find the IP address of the remote instance and access it via your web browser