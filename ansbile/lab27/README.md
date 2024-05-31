# Lab 27
## Objective: Ansible Roles For Application Deployment
Organize Ansible playbooks using roles. Create an Ansible role for installing Jenkins, Doker , openshift CL 'OC'

## Step1: Setup the Directory stracture 
- Here's the stracture of the task `ansible_project`

Check the attached files for each role
  ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/fc9b4584-557a-4a50-9f87-301d54c52778)

## Step2: Perpare AWS Environment
1- Create IAM user with a programmatic access and save its crediantials.

2- Login through `aws configure`

3- Make sure that you have running EC2 intance assigned to Public subnet.

4- Put EC2 instance's Public IPv4 address in ithe inventory file 

5- Build the playbook file in the main root.

## Step3: Run the playbook.
Run the playbook through this command ` ansible-playbook -i inventory_file playbook.yaml file`
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/d397bae7-c4ec-45d9-b9c7-7178652e0d3c)

