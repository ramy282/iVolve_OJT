# Lab 22 SDK and CL Intergrations
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
}
```

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/b25a8c1c-a6cb-4542-a4b4-084f3f78de67)

## Step4: Configure Permissions for IAM user 

