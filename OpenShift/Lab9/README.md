# Lab 9: Storage Configuration 
## Objective:
Create a Kubernetes deployment named my-deployment with 1 replica using the NGINX image. Exec into the NGINX pod and create a file at /usr/share/nginx/html/hello.txt with the content hello, this is Ramy, verify the file is served by NGINX using curl localhost/hello.txt. Delete the NGINX pod and wait for the deployment to create a new pod then exec into the new pod and verify the file at /usr/share/nginx/html/hello.txt is no longer present. Create a Persistent Volume Pv and Persistent Volume Claim (PVC). Modify the deployment to attach the PVC to the pod at /usr/share/nginx/html. Repeat the previous steps and Verify the file persists across pod deletions. 

## Step1: Create Nginx Deployment
- to create nginx deployment with 1 replicas
  
```
oc create deployment my-deployment --image=nginx --replicas=1
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/a3b08a8e-f6ee-4622-b163-8120acedbef7)

## Step2: Exec to Nginx pod 
- to exec to Nginx pod
  
```
oc exec -it my-deployment-7c86cc47f6-vzvdf -- /bin/bash
echo "hello, this is Ramy" > /usr/share/nginx/html/helloRamy.txt
exit
```

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/6b006fe7-076c-41dc-b01b-b7da189bd4bb)

## Step 3: Verify the File is Served by NGINX

- To verify the Nginx pod use port-forward

```
oc port-forward my-deployment-7c86cc47f6-vzvdf 8087:80
```

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/9d2f1119-f040-4ed9-9ac4-5bd99d79eaba)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/53545fb7-1ce1-4828-8b55-10af4c4567d5)

## Step3: Delete the pod 

- delete the pod and wait until the pod is recreated

-  Noticed that hellRamy.txt file is delete 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/84373e8c-36bb-4363-8567-681a837e3c2f)

## Note: a new pod created with new name and ID bec. it is part of Deployment of Stateless app and the is No Longer Present

to solve that problem use PV and PVC 

## Step4: Create a Persistent Volume (PV) and Persistent Volume Claim (PVC)

- Create volume.yml for Persistent Volume (PV) and pvc for Persistent Volume Claim (PVC)

- Apply the two files

```
oc apply -f volume.yml pvc.yml
```

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/8b9277c0-515b-40e4-b800-e88d6af56dbd)

## Step 5: Modify the Deployment to Attach the PVC

- delete the deployment and recreate the dployment with attached PVC

  ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/b322083b-ff22-480c-babd-eb8174bee76b)


## Step 6: Exec to The New Nginx pod

- Exec to the new pod with attached pvc

- Verify the content of the pod through port-forwar command

 ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/8a6863b6-b80d-4ce2-a7d1-57804d17f522)

 ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/7dd0ec2f-f12b-45a3-96d8-36021517c05d)


## Step 7: Delete the New Nginx Pod

- Delete the new Nginx pod

- A new pod was recraeted

- Noticed how the pvc will save the pod data

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/216c69d1-d6b1-4c65-98d8-fabec31abe12)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/25094cab-156d-45c3-9ef7-6b88864f41ea)

  

  

   
