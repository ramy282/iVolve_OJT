# lab 20
## Objective:
Create private subnet and lunch EC2 , configure security groups, connect to the instance using Bastion host.

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
