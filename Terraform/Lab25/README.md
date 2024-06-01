# Lab25 
## Objective: Modules
Modularize Terraform configurations using modules. Create reusable components for common infrastructure patterns and deploy then in different environments.

## Step1: Step Terraform enivroment 
1- Create AWS IAM user with programmatic acces.

2- login to that user from CLI using: `aws configure` and Enter acces key, etc..

## Step2: Set Up the Modules architecture 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/43c92eb9-3aca-45c0-8b90-d4c011d70a7e)

- Check the attached files for each module

## Step3: Initialize Terraform 
- run command `terraform init`
  ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/9d9628b8-23c6-4609-9ed0-7064db195c19)

## Step4: Plan and apply
- run Command 'terraform plan'

  ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/c989cc97-6126-4af3-86ee-966794269a2f)

- run command `terraform apply`

  ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/3a43343f-3d04-499a-9b24-eac74a00094f)

  ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/21096f35-5708-460c-8413-2048d6f2ad65)

## Step5: Check te Created resources

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/f002953a-b887-4925-85be-c98faabb2640)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/b5b30fff-ffda-43ed-8702-7be4755732ae)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/2b84b149-255f-407b-958f-1c6d196a09fd)

## Step5: destroy the created resources
- run command `terraform destroy`
  ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/4c341f72-bc80-4ac2-9124-c34caf8941ec)


