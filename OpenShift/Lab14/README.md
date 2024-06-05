# Lab14: Helm Chart Deployment

## Objective: 
Use Helm Chart to deploy and manage applications in an OpenShiftcluster. Explore Helm charts for common services. Create a new Helm chart for Nginx. Deploy the Helm chart and verify the deployment.Access the Nginx server.Delete nginx release.

## Step1: Create a Helm Chart for Nginx

1 - To Create a New Helm chart
```
helm create nginx-char
cd nginx-chart
```

2- Edit values.yml file and change service type from ClusterIP to NodePort 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/4c71e9fb-cd2d-4339-8c9c-6be89b72c22b)


## Step2: Deploy the Helm Chart 

- Deploy the Nginx Helm chart to your cluster
  
```
helm install nginx ./nginx-chart
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/1cca3d35-0973-4206-bc60-61b0572759c2)

## Step3: Verify the Deployment

- Check the pod and Service

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/c143a0df-712d-41a7-86e3-2e16c275b2a8)

## Step4: Access the Nginx Server

- Use port-forward to access Nginx locally
```
oc port-forward service/nginx-nginx-chart 8091:80
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/90ba293a-fd2d-4d7b-8ec6-438716709e9c)

- Access Nginx locally at 8091
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/f8e1b33e-39ac-49b2-988c-9f0b0bb491ca)

## Step5: Delete Nginx 

- To delete nginx
```
helm uninstall nginx
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/40ace1f4-a690-4cb4-80ef-3dd4e3977a17)
