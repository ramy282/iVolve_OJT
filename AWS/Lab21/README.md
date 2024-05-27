Step 1: Create a VPC
Sign in to the AWS Management Console.
Navigate to the VPC Dashboard:
Go to Services and select VPC.
Create a VPC:
Click on "Your VPCs" in the left-hand menu, then click "Create VPC".
Name your VPC (e.g., "MyVPC").
Set the IPv4 CIDR block (e.g., 10.0.0.0/16).
Choose other settings as needed and click "Create VPC".
Step 2: Create Two Subnets
Create Subnet 1:

In the VPC Dashboard, click on "Subnets" and then "Create subnet".
Select your VPC from the list.
Name your subnet (e.g., "Subnet1").
Set the IPv4 CIDR block (e.g., 10.0.1.0/24).
Choose an Availability Zone.
Click "Create subnet".
Create Subnet 2:

Follow the same steps as Subnet 1, but name it "Subnet2" and set the IPv4 CIDR block to a different range within your VPC (e.g., 10.0.2.0/24).
Step 3: Launch Two EC2 Instances
Navigate to the EC2 Dashboard:

Go to Services and select EC2.
Launch Instance 1 (Nginx):

Click "Launch Instance".
Choose an Amazon Machine Image (AMI) (e.g., Amazon Linux 2).
Choose an instance type (e.g., t2.micro).
In the "Configure Instance" section, select your VPC and Subnet1.
Configure other instance details as needed and click "Next".
Add a tag with key Name and value Nginx-Server.
Configure the security group to allow HTTP (port 80) and SSH (port 22).
Click "Review and Launch".
Launch the instance and download the key pair.
