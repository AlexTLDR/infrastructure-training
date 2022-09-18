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