# Lab17: Container Orchestration with Kubernetes Operators.

## Objective: 
What is k8s operators? Deploy ArgoCD, ELK using Operators. Explore the capabilities of Operators for application lifecycle management.

### PART1: What is k8s operators?
An operator is a Kubernetes extension that automates the deployment of an application. Operators typically provide controllers and Custom Resource Definitions (CRDs) that let you rapidly deploy new app instances without deep knowledge of their requirements or how they work.

## Deploy ArgoCD On K8s cluster
## STEP1: Install ArgoCD
- to install AgroCD as showen in the official site https://argo-cd.readthedocs.io/en/stable/getting_started/

1- Create a namespace called ArgoCD

2- Apply ArgoCD manifest YAML file 

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/542e7d01-bcc0-40ec-a309-dea12fe05440)

## Step2: Verify that ArgoCD is running 
- Check the pod of ArgoCD is running
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/6a96d379-7e17-4c3b-9a0d-c37bfe22baf9)

## Step3: Expose ArgoCD Service
1- Det the ArgoCD svc 

2- Expose ArgoCD svc to be accessable
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/8f7f026c-e676-43f8-80e2-cfb5ea3ec09c)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/96788cd1-d1b7-4a6b-a686-6d1e5dd99cf3)

## Step4: Access ArgoCD 
- To access ArgoCD go to your browser and visit http://localhost:8080/
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/c94d451c-1dfa-4f7b-807b-4850d0d16a70)

## Step5: Get Your credentials

- You can login to ArgoCD using Admin as username and the password stored encoded in argocd-initial-admin-secret under password filed

- To decode your your password
```
echo <your-encoded-password> | base64 --decode
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/fbe160bd-a069-44de-9fba-06841ff47b7b)

- use the decoded output to login to ArgoCD

## Step6: Manage your applicaton 

- When you apply your application at ArgoCD namespace

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/8aa93977-582c-4c8a-a169-ff56d026face)
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/57e8d29e-4907-438d-a392-4ef619198ae3)

- After you delete your application
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/1ca59583-83f7-43a9-9392-a4f923002039)

  
  
