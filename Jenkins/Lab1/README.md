# Lab1: 
## Objective:
1- The pipeline is designed to build a Docker image of the application, push it to Docker Hub, and deploy it to an OpenShift cluster. 

2- The Jenkins pipeline leverages a master-slave architecture and utilizes a shared Jenkins library for modular and reusable pipeline code.

## Step1: Create A Service Account

1- Create A service account on your oc cluster 
```
oc create service account jenkins
```
2- Add role to your service account to access the token 
```
oc policy add-role-to-user admin system:serviceaccount:ramyanwar:jenkins
```
3- get oc token 
```
oc sa get-token jenkins
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/4a882612-5418-4ea3-aeda-dfe0a74f8883)




