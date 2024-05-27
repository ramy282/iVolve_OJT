# Lab 19 : AWS Secuirty 
## Objective:
Create AWS account , set billing alarm , create 2 IAM groups (Admin and developer ) admin group has admin permission , developer group only access to s3 , create admin-1 user console access only with MFA & admin-2-prog user with CLI access only and list all users and groups using commands , create dev-user with programmatic and console access

## Step1: Create IAM Groups 
Create Admin group 
1. From service menu select "IAM".
2. "User groups" and then "Create group".
3. Name the group "Admin" and Attach the "AdministratorAccess" policy to this group.
4. Click "Create group".
Create Developer group
1. select "User groups" and then "Create group".
2. Name the group "Developer" and Attach the "AmazonS3FullAccess" policy to this group.
3. Click "Create group".
   
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/db9309c8-4312-4e24-959a-664cc59dbc8f)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/bf48bd7d-115b-41ce-b4ef-9cdaf1c10d7e)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/41df96d2-2543-4648-9fb9-e0a9380e7a55)

 ## Step2: Create Users and Assign Them to Groups
 ### Admin-1 User (Console Access Only with MFA)
1. Create Admin-1 User:
- Select "Users" and then "Add user".
- Name the user "admin-1".
- Select "AWS Management Console access".
- Check "Require password reset".
- Click "Next".
  
2. To assgin to "Admin group"
- Select "Add user to group" and Choose the "Admin" group.
- After creating the user, go to "Users" and select "admin-1".
- Go to the "Security credentials" tab.
- IN "Multi-factor authentication (MFA)" Section.
- Follow the prompts to set up MFA.

### Admin-2-Prog User (CLI Access Only)
3- Create Admin-2-Prog User:
- From select "Users" and then "Add user".
- Name the user "admin-2-prog".
- Click "Next".
4 -To assign User to Admin Group:
- Select "Add user to group" and Choose the "Admin" group.
### N.B : Save or download the access key ID and secret access key.
- After creating the user, go to "Users" and select "admin-1".
- Go to the "Security credentials" tab.
- In "Access key section" Select "Create access key"
- Select "Command Line Interface (CLI)" and Next and create access key.
  
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/752e5f0a-3dd7-4f85-a927-1877b3af2a79)

### Dev-User (Programmatic and Console Access)
3- Create Dev-User:
- select "Users" and then "Add user".
- Name the user "dev-user" and Check "Require password reset".
4- To assign User to Developer Group:
- Select "Add user to group".
- Choose the "Developer" group.
### N.B: Save or download access key ID and secret access key.
- After creating the user, go to "Users" and select "dev-user".
- Go to the "Security credentials" tab.
- In "Access key section" Select "Create access key"
- Select "Command Line Interface (CLI)" and Next and create access key.

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/61025ad4-100e-482e-a016-f49f291e523c)
  
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/0cc6fbf7-ba08-4296-9bfa-429990571001)

## Step3 : List All Users and Groups Using Commands:
1 - Run : `aws configure` and give it the 
- AWS Access Key ID :
- AWS Secret Access Key [None]:
- Default region name [None]: 
- Default output format [None]:

2-  Run the following command to list all users: `aws iam list-users`

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/eeafa53f-5275-4786-abcb-5ddc819312f6)

3- Run the following command to list all groups: `aws iam list-groups`

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/8287a501-9fd9-4f66-bdfd-e3eb21bccb15)

## Step4: Set a Billing Alarm
1- From services menu and select "CloudWatch".
2- In the CloudWatch dashboard, select "Alarms" then "Billing" and click "Create alarm".
3- Click "Select metric" and choose "Billing".
4- Select "Total Estimated Charge".
5- Set your threshold value and enter your email.

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/df55cca5-f574-4877-ae27-6e0dec35053f)


