# Lab26 :

## Objective: Ansible Dynamic Invaentories
Set up Ansible dynamic inventories to automatically discover and manage infrastructure. Use dynamic inventories to scale playbook execution across different environments.

## Step1: Prepare AWS Environment.
1- Make sure you have IAM user with a programmatic access and save its credentials.

2- Make sure you have a runnig  EC2 instances asigned to public subnet and you can connect to it using "ssh" 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/4b93477c-eeb1-4180-93ee-8d5af3701df8)

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

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/93e2c4e7-ab61-4ac7-8630-df604e009967)

## Step4: Test the Dynamic Inventory

1- Before running the playbook, test the dynamic inventory to ensure it correctly retrieves the EC2 instances:

`ansible-inventory -i aws_ec2.yml --list`

This command should output a JSON structure with your EC2 instances and its configurations.
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/0e0c3be3-41d1-42d8-9ce6-d7b350426e3b)

This command should display a graph of your inventory structure as discovered by the aws_ec2 plugin.

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/4e06d5dd-4624-45dd-b302-5caeeaab0a07)


## Step5: Configure the playbook:
1- Create a playbook to ensure that the python is installed and install nginx server.

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/b4685eac-b8de-45bd-8d50-337e42d3b1da)

## Step6: Run the Playbook
Run the playbook using the dynamic inventory file.

`ansible-playbook -i aws_ec2.yml playbook.yml`
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/07bd9d92-2f76-48f3-adb0-e0a4d935cf8e)







