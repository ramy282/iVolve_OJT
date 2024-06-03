# Lab 12




# Step 1: Create a Namespace

- Create "nti" namespace
  
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/6832de78-9a12-45fb-8845-69fb6945d644)

# Step 2: Apply Resource Quota

- Apply resouce quota for the resources inside nti namespace
  
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/04a952da-bffa-457a-a32e-822d1584c163)

## Step 3: Define ConfigMap and Secret

- Create Congig map to map MySQL username and password

- Store the credintials in secret file.

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/c5af4a9b-bf22-406f-8f4b-1260c4417b42)


## Step4: Create Deployment For MySQOL

- Create a deployment for MySQL pod with 1 replica
  
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/bc008e49-5ba6-4e80-a29d-5eaea1fa1e1e)


## Step 5: Verify MySQL Configuration

- Exec to MySQL pod to verify it works  

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/827325b6-081c-4c10-9d97-37f2048e1f69)
