# Lab 8: Deployment vs. Statefulset 

## Objective: 
Make a Comparison between Deployment and Statefulset. Create a YAML file for a MySQL StatefulSetconfiguration. Write a YAML file to define a service for the MySQL StatefulSet.

# Part 1: Comparison between Deployment and Statefulset

| Feature | StatefulSet | Deployment |
|:----------|:----------:|:----------:|
| Stateful/Stateless applications | Stateful | Stateless |
| Pod identities	| Pods are assigned a persistent identifier, derived from the StatefulSet’s name and their ordinal creation index.	 |Pods are assigned random identifiers, derived from the Deployment’s name and a unique random string.|
| Pod interchangeability | Pods in a StatefulSet are not interchangeable. It’s expected that each Pod has a specific role, such as always running as a primary or read-only replica for a database application.	 | All Pods are identical, so they’re interchangeable and can be replaced at any time. |
| Rollout ordering| Pods are guaranteed to be created and removed in sequence. When you scale down the StatefulSet, Kubernetes will terminate the most recently created Pod |No ordering is supported. When you scale down the Deployment, Kubernetes will terminate a random Pod.|
| Storage access | Each Pod in the StatefulSet is assigned its own Persistent Volume (PV) and Persistent Volume Claim (PVC). | All Pods share the same PV and PVC. |

## StatefulSet and Deployment use cases

### Choose a StatefulSet in the following scenarios:

- Deploy stateful application that requires stable, persistent storage, such as a replicated deployment of a database, file server, or messaging queue.

- Pods are non-interchangeable because they each have specific roles.

- Require predictable sequenced rollouts, with terminations that occur in reverse order.


### Choose a Deployment when the following criteria apply:

- Deploy stateless; it does not require persistent storage, or all Pods can share the same storage volume.

- Multiple replicas of a Pod to be created from one declaratively defined configuration.

- You need controlled rollouts and rollbacks, based on changes you make to your declared state.

# Part 2: 
## Create a YAML file for a MySQL StatefulSetconfiguration. Write a YAML file to define a service for the MySQL StatefulSet.

## Step1: Create MYSQL Statefulset and service 

- Build mysqlstateful.yml file for MySQL StatefulSet
  
- Build mysqlservice.yml to expose MySQL StatefulSet

 ```
oc apply -f mysqlstateful.yml
```

```
oc apply -f mysqlservice.yml
```

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/efd6d470-6da7-40b1-8a64-acf33bce8bc1)

## Step2: Check Statefulset properties 

- try to access the pod

```
oc exec -it mysql-statefulset-1 -- bin/bash
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/f0ec0563-dc63-4a3c-9bf3-d6e3c17846b0)

- try to delete pod and wait the recreation of the pod
## Note : 

- the pod was recreated with the same name
  
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/a5ceb5cf-2d08-4eed-afb1-01f4c58aab6d)


