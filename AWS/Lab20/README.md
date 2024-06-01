# lab 20: Launching anEC2 Instance
## Objective: Create private subnet and lunch EC2 , configure security groups, connect to the instance using Bastion host.

## Step1: Create VPC 
1- From "Your VPCs" click "Create VPC".
2- Enter the name of VPC ( iVolve-VPC ).
3- Set the IPv4 CIDR block (10.0.0.0/16).
 ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/7c750986-055b-488a-b789-fb029a1bbbe9)

## Step2: Create 2 Subnet ( 1 private and 1 public)
1- Create a Private Subnet:
- click on "Subnets" and then "Create subnet".
- Select your iVolve-VPC from the list.
- Enter subnet name (iVolve-PrivateSubnet).
- Set the IPv4 CIDR block (10.0.1.0/24).
  
2- Create a Public Subnet:
- the same steps as but Enter the IPv4 CIDR block (10.0.2.0/24).
- Enter subnet name (Bastion).
  ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/0040ae67-9d97-4277-8b3e-ffb2f3aa8298)

## Step3: Create Security Groups
1- Create a Security Group for Bastion EC2:

- click "Security Groups" and "Create Security Group".
- Enter the name (BastionSG)
- Add an inbound rule to allow SSH access from your IP (0.0.0.0/0 for all IPs).
- Click "Create Security Group".
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/5f1312eb-b3c1-4dda-a740-db4e7483f0c5)

## Step 4: Create EC2 Instance in the Private Subnet
- From Services and select EC2.
-  Name (iVolve_priv_inst)
- Launch an Instance and Click "Launch Instance".
- Choose an Amazon Machine Image (AMI) (Amazon Linux 2).
- Choose an instance type (t2.micro).
- In the "Network Settings" section Click edit and select your VPC and the private subnet.
- Create keypair (iVolve-key)
### Configure Security Group:
- Choose Create a new security group ("PrivateSG").
- Add a rule to allow SSH access only from the bastion host.
- Add an inbound rule to allow SSH access from the BastionSG security group.
- Click "Review and Launch".
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/e2a399f2-0d80-4f0a-b356-bc7b59040444)

## Step 5: Create EC2 Instance in the Public Subnet
- same Steps as the private subnet.
- Name (Bastion)
- In the "Network Settings" section Click edit and select your VPC and the  Public subnet.
- Create keypair (iVolve-key)
### Configure Security Group:
- Select existing SG and choose (BastionSG).
- Click "Review and Launch".
 ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/2b81f2bb-ba53-43d3-ba7c-1a64842d6e7a)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/4d4e9148-fcee-4194-8d79-b319c8aa820a)

## Step 6: Connect to the Private Instance via the Bastion
1- Connect to the Bastion Host:
- Use SSH to connect to the Bastion . ` ssh -i OneDrive\Desktop\iVolve-key.pem ec2-user@54.82.55.71`
  
2- Connect to the Private Instance from the Bastion Host:
- in the Bastion Host, use SSH to connect to the private instance. ` ssh -i OneDrive\Desktop\iVolve-key.pem ec2-user@3.239.76.184`
  
  ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/3fbd65ab-1ea9-4fc6-b405-6d8fb6df52b0)

