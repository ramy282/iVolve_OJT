# Lab 11 : OpenShift Security and RBAC

## Objective: 
Create a ServiceAccount. Define a Role named pod-reader allowing read-only access to pods in the namespace. Bind the pod-reader Role to the ServiceAccount . Get ServiceAccounttoken. Make a Comparison between role & role binding and cluster role & cluster role binding.


## Step1: Create a ServiceAccount

- Define a ServiceAccount in a YAML file:

- Define the role in YAML file llows read-only access to pods in the namespace.

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/6bf491ac-e3c4-4dba-80d8-fd20af61d398)


## Step2: Bind the Role to the ServiceAccount

- Define Binding role to link The Role to the Service account
  
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/c4eb21f4-0e82-4db9-bfdc-c1d73f35a371)

## Step3: Create secret file

- Define a Secret file to Store the ServiceAccount token in it.

  


