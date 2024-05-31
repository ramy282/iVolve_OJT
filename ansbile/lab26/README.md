# Lab26 :

## Objective: Ansible Dynamic Invaentories
Set up Ansible dynamic inventories to automatically discover and manage infrastructure. Use dynamic inventories to scale playbook execution across different environments.

## Step1: Prepare AWS Environment.
1- Make sure you have IAM user with a programmatic access and save its credentials.

2- Make sure you have an EC2 instances asigned to public subnet and you can connect to it using "ssh"

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/040150d6-ce13-4ed9-bb17-b88a185c7bc3)

3- Set Up AWS Credentials:

`export AWS_ACCESS_KEY_ID='your_access_key_id'`

`export AWS_SECRET_ACCESS_KEY='your_secret_access_key'`

`export AWS_DEFAULT_REGION='your_default_region'`

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/5436467d-38d4-4404-9a6c-c1b49b915a98)

## Step2: Install Necessary Python Packages
1- Install boto3 and botocore through these commands:

`sudo apt update`

`sudo apt install python3-pip`

`pip3 install boto3 botocore`

## Step3: Configure Dynamic Inventory

1- In lab26 dir configure the content of `aws_ec2.yml` inventory
