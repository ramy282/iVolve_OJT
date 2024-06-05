# Lab 21: Create Aws LoadBalancer 

## Objective: 
create VPC  with 2 subnets, launch 2 EC2s with nginx and apache installed, and create and configure a load balancer to access the web server.

## Step 1: Create a VPC

1- From "Your VPCs" click "Create VPC".
2- Enter the name of VPC ( iVolve-VPC ).
3- Set the IPv4 CIDR block (10.0.0.0/16).

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/46a91f5b-bdcc-46d4-ab13-05bd9ec29324)

## Step 2: Create Two Subnets
1- Create Subnet 1:

- click on "Subnets" and then "Create subnet".
- Select your iVolve-VPC from the list.
- Enter subnet name (Subnet1).
- Set the IPv4 CIDR block (10.0.1.0/24).
- Choose an Availability Zone.
- Configure the suitable Secuirty Gate.

2- Create Subnet 2:
- Follow the same steps as Subnet 1, but name it "Subnet2" and set the IPv4 CIDR block to a different range within your VPC (e.g., 10.0.2.0/24).

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/361d671e-fe4f-4267-b521-42fb270e8993)

## Step 3: Launch Two EC2 Instances

1- Launch Instance 1 (Nginx):
- From Services and select EC2.
-  Name (Nginx-Server)
- Launch an Instance and Click "Launch Instance".
- Choose an Amazon Machine Image (AMI) (Amazon Linux 2).
- Choose an instance type (t2.micro).
- In the "Network Settings" section Click edit and select your VPC and Subnet1.
- Create keypair (iVolve-key)
- Configure the security group to allow HTTP (port 80) and SSH (port 22).
### Install Nginx on Instance 1:
SSH into the instance: ` ssh -i "iVolve-key.pem" ec2-user@10.0.2.7`
Install Nginx: 
- `sudo yum update -y`
- `sudo amazon-linux-extras install nginx1.12 -y`
- `sudo systemctl start nginx`
- `sudo systemctl enable nginx`
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/9c40e2dc-d02c-4908-a55a-cf7a1e369f91)
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/71be93f2-ca43-4fc2-818b-6b8e90213124)

2- Launch Instance 1 (HTTP):
- Follow the same steps as Nginx Instance 1, but place this instance in Subnet2.
- Enter the name (HTTP)
- Configure the security group to allow HTTP (port 80) and SSH (port 22).

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/9e955efa-cdab-4b45-bfa2-8a04e45c81bd)

### Install Apache on Instance 2:
SSH into the instance: ` ssh -i "iVolve-key.pem" ec2-user@10.0.1.12`
Install Nginx: 
- `sudo yum update -y`
- `sudo amazon-linux-extras install httpd  -y`
- `sudo systemctl start httpd`
- `sudo systemctl enable httpd `
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/fecbc9fe-1b39-456f-aa8c-9f24764e0283)

## Step 4: Create a Security Group for the Load Balancer
- click "Security Groups" and Click "Create Security Group".
- Enter the name ("LoadBalancerSG") .
- inbound rule for HTTP (port 80) from anywhere (0.0.0.0/0).
- inbound for HTTPS (port 443) from anywhere (0.0.0.0/0).
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/76473506-ddf5-48e4-bf23-19e314d5efb6)

## Step 5: Create a LoadBalancer
1- Create a LoadBalance 
- Click "Load Balancers" and click "Create Load Balancer".
- Choose "Application Load Balancer".
- Enter the Name of loadbalancer ("MyALB").
- Select "Internet-facing" as scheme.
- Select (iVolve-VPC) and choose both subnets.

2- Configure Security Groups:
- Choose "LoadBalancerSG" security group to the load balancer.
- Create a target group ("WebServers") for the instances, using the HTTP protocol and port 80.
- Configure a listener on port 80.
- Choose the instances (Nginx and Apache) and add them to the target group.
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/c95bb7c3-2538-4b32-953d-a622d93e50f3)

## Step 6: Test the Load Balancer
- copy the DNS name and Open a web browser and navigate to the DNS name of the load balancer.
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/691cff2f-7f0c-4376-8c1d-844816bfe5fb)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/bc5bfe58-455f-42d9-8fae-7d409c0f4d9b)

