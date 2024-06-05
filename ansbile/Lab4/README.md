# Lab4: Ansible Installation 

## Objective:
Install and configure Ansible Automation Platform on control nodes, create inventories of 2 managed hosts, and then perform ad-hoc commands to check functionality.

## Step1: Install and Configure Ansible Automation Platform on Control Nodes

- First you need to download the Dependencies

- Add the Ansible PPA and install Ansible

- Verify Installation   
```
sudo apt update
sudo apt install -y git python3 python3-pip sshpass
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible
ansible --version 
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/e81edbbc-c3c8-4f3c-90ec-fe7cadb78f53)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/7949890a-5389-4863-b465-15118fb987ce)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/f6e9665d-fb1b-455a-8050-1fc80cc1d4ad)

## Step2: Perpare AWS Enviroments 

- Make sure you have two Running EC2 Instances assigned to a Public subnet

- Make Sure you access the EC2 instances through ssh

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/75c153c8-cff5-48c5-8b5f-2dc445ad8ad5)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/e352d5fa-2fc0-4d21-8e01-8674764cbde7)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/1de9c0f5-28bb-41f5-9523-654ae07f9fd5)

 
## Step3: Create Inventory file 

- Create inventories file for the 2 Managed hosts

- Put the IPv4 of 2 hosts


## Step4: Verify the two host 

- Perform Ad-hoc Commands to Check Functionality

```
ansible hosts -i inventory -m command -a "sudo touch /home/iVolve"
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/38f43b68-27de-40f6-a636-045bdc5e4948)
   

