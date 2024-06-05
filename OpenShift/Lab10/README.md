# Lab10: Network Configuration 

## Objective: 
Build image from Dockerfile https://github.com/IbrahimmAdel/static-website.gitand push it to your DockerHub. Create a deployment using thiscustom NGINX image.Create a service to expose the deployment.Define a networkpolicythat allow traffic to the NGINX pods only from other pods within the same namespace.Enable the NGINX Ingress controllerusing Minikube addons. Create an Ingressresource. Update /etc/hosts to map the domain to the Minikube IP address. Access the custom NGINX service via the Ingress endpoint using the domain name. create a route in openshift.

## Step1: Build the Docker Image

- clone the repository and build the Docker image.
  
```
git clone https://github.com/IbrahimmAdel/static-website.git`
cd static-website
docker build -t Ramy282/static-website:latest
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/7302c2d5-d056-4475-b1ce-e889df48230f)

## Step2: Push the Docker Image to DockerHub

- Login to your DockerHub and Push the image

```
docker login
docker push ramy282/static-website:latest
```

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/7cd4d2f5-a0ba-4f88-9f12-f9e9f3f8fc6c)

## Step 3: Create a Deployment Using the Custom NGINX Image

- Create a YAML file for the deployment.

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/ffaefaf1-fb85-475c-ab6e-c11f8773398c)

## Step 4: Create a Service to Expose the Deployment

- Create a YAML file for the service.

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/cc1991bf-6759-4982-b7f9-f35053fc564d)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/f8311da8-aa0e-4edc-b323-94abd81d9ce2)

## Step 5: Define a NetworkPolicy 

- Create YAML file for the NetworkPolicy

- Enable the NGINX Ingress Controller in Minikube

  ```
  minikube addons enable ingress
  ```
  
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/f309fd40-d9e1-4c1d-af56-f41154298ae4)

## Step 6: Create an Ingress Resource

- Create a YAML file for the ingress resource.

- Update the /etc/hosts to access the docker image locally

  ```
  echo "$(minikube ip) static-website.local" | sudo tee -a /etc/hosts
  ```

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/8a162322-b447-4238-9a0c-7f4986f3e334)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/6836ac40-d458-4472-8102-95b1e2d0a840)

 - Check the connection to the doker image

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/9770e9a7-51ab-4bf1-87be-0979c5df892a)
  

