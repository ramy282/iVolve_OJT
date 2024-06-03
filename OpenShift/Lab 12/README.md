# Lab 12: Configuring MySQL Pod using Configmap and Secret

## objective:
Create a namespace called nti and Apply resource quota to limit resource usage within the namespace. Create a Deployment in this namespace for the MySQL pod that uses the ConfigMap and Secret. Define MySQL database name and user in a ConfigMap. Store the MySQL root password and user password in a Secret, Resources Requests: CPU: 0.5 vcpu Mem: 1G, Resources Limits: CPU: 1 vcpu Mem: 2G. Exec into the MySQL pod and verify the MySQL configuration

## Step 1: Create a Namespace

- Create "nti" namespace
  
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/6832de78-9a12-45fb-8845-69fb6945d644)

## Step 2: Apply Resource Quota

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

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/3f09e461-7872-48a3-9fac-0d778ff80876)
