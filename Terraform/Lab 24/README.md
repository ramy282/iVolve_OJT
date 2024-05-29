# Lab 24 : Multi-tier Application Deployment with Terraform 
# Objective:
user Terraform to define and deploy a multi-tier architecture, including VPC, subnetes, EC2 instances, and RDS database.

## Step1: Step Terraform enivroment 
1- Create AWS IAM user with programmatic acces.

2- login to that user from CLI using: `aws configure` and Enter acces key, etc..

3- run command `mkdir lab24` and `cd lab24/`

Here's the architecture of the task:
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/9f95e2cd-7f60-4d49-a268-fceaff2cbfe2)

## Step2: Create main.tf file.
1- Create main.tf file: `vim main.tf`'

2- the content of `main.tf` file. check the attached file

## Step3: Create Variables.tf file.
1- Create variables.tf file: `vim variables.tf`

2- the content of `variables.tf` file. check the attached fils

## Step4: Configure the terraform 
1- Run the following Consecutive Commands:

  to Initialize Terraform: `terraform init`
  
  to see the terraform plan: `terraform plan`
  
  to apply the Configuration: `terraform apply`
  
  to end the resources: `terrform destroy`

### Here's the screenshots for building process:
`terraform init`

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/bab2b05e-0c00-40e5-b2ef-391855e69a3d)

`terraform plan`

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/85feb398-93cd-402e-a8ee-c4bc6f109a4f)

`terraform apply`

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/d41e4513-a79c-4dad-9197-320f6beddfa3)

`terraform destroy`

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/21197fe3-fe7e-4cbd-a3ed-422dc640c29e)

### Here some screenshots from AWS console to see the resources 

### 1- VPC 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/3da92e91-53a4-4681-b5ad-99dc42d59a1b)

### 2- Subnets (1 public and 2 private )

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/832426e7-107f-47ca-9798-03f0d9f556e7)

### 3- EC2 Instance

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/e957c6a2-59d9-4ac9-bc2b-7cfe3ade1153)

### 4- Secuirty group

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/ad094482-c78f-4c40-839d-cf70f879ab41)

### 5-Route Tables

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/b92038bf-0dd6-4735-874e-5bfa95701a3a)

### 6- RDS Database
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/774fba4f-c535-411f-8c87-33f9c4d2fe54)
