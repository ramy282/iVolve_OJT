# Lab 23: Serverless Application Development
## Objective: Build a serverless application using AWS Lambda, API Gatway, and DynamoDB.

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/61f1567b-99e3-4b70-929d-7f3b83f82eb4)

## Step1: SetUp AWS Environment 
1- Create IAM role for Lambda Function with AWSLambdaBasicExecutionRole and AmazonDynamoDBFullAccess Perrmissions.

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/05b325cd-12e0-4321-8750-0e2a30eca040)

## Step2: Create DynamoDB 
- Create DynamoDB "iVolveTable".
- with email as Primary key and keep the default configuartion

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/19e3a9f8-caa0-48ca-b29d-b30e501f209c)
  

## Step3: Create a Lambda Function 
- Create Lambda Function giving it the "Servless-app" Role as Execution role.
- Upload the attached zip file 
- Edit the table name in .py file as the same name of DynamoDB table
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/0da6f75c-1ae9-4434-84f6-3daa0f0d2ac6)


## Step4: Create API Gateway 
- choose "REST API" , New API and enter its name with regional endpoint
- Click create method
- Select GET as a method type, Lambda proxy integration and choose your Lambda Function
- Select POST as a method type, Lambda proxy integration and choose your Lambda Function

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/70cb8a47-2173-466d-91b6-ce274f5a153f)

## Step5: Deploy the apllication 
- Click deploy then NewStage "dev" and copy invoke URL 
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/1413abc9-100f-408c-b023-387de2c5b86b)

- Paste the copied URL in your Browser
- Enter Your Data
  
  Here's the application is running
  
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/60bd9ac4-332a-421e-9e04-0f2545bb1c92)

 - Click Submit
   
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/6bbdf6ba-3e03-4a28-b891-4183cf5750dc)

## Step6: Check the Database 

-Go back to DynamoDB and check the records 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/1d102111-0df1-4484-9119-61766be1f018)




