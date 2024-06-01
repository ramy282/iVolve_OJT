# Lab 22: SDK and CL Intergrations
## Objective: Using AWS CLI to Create an S3 bucket, Configure permisssons, andd upload/download files to/from the bucket. Enable Versioning and Logging for the bucket.

## Step1: SetUp AWS environment 
1- Create IAM user with programmatic access and AmazonS3FullAccess permission 
2- Run command `aws configure` on AWS CLI and enter AWS Access Key ID, AWS Secret Access Key and etc..

## Step2: Create an S3 Bucket
- to craete a bucket run
  
  `aws s3api create-bucket --bucket ivolve --region eu-north-1 --create-bucket-configuration LocationConstraint=eu-north-1`
  
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/65df936a-e707-499a-b527-d26749909c83)

## Step3: Configure Permissions for IAM user 
- choose on your IAM user in permission tab
- click add permissions and select create inline ploicy
- under the json format enter this permission
  ```
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::ivolve",
                "arn:aws:s3:::ivolve/*"
            ]
        }
    ]


![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/b25a8c1c-a6cb-4542-a4b4-084f3f78de67)
## Step4: Enable Versioning for S3 Bucket 
- run commmand `aws s3api put-bucket-versioning --bucket ivolve --versioning-configuration Status=Enabled`
  ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/5b5747f6-d2b8-4888-8125-56ee4402092e)

## Step5: Enable Logging for S3 
 
- create another bucket to store logs of the main bucket
- run command
-  `aws s3api create-bucket --bucket ivolve-logs --region eu-north-1 --create-bucket-configuration LocationConstraint=eu-north-1`
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/809aa45d-b56a-45ef-a238-0fb8ef320e31)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/85b4e96d-157f-4877-94cf-1e5a2f335229)

- Enable logging for the main bucket
  
`aws s3api put-bucket-logging --bucket ivolve --bucket-logging-status "{\"LoggingEnabled\":{\"TargetBucket\":\"ivolve-\",\"TargetPrefix\":\"logs/\"}}" `

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/1152889d-5f17-4658-8179-8b2126683603)

## Step 6: Upload/Download Files from/to the bucket 

- to upload file rum command

`s3 cp "C:\Users\Bishoy Anwar\OneDrive\Desktop\ivolve.png" s3://ivolve/pic`

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/8b48a7a9-7638-4cf5-bc82-81aafb95cf31)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/2696cf75-5a48-438d-b7a1-35b48fa5df93)
