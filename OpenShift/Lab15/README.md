# Lab15: Daemonsets & Taint and Toleration 

## Objective: what is daemonset and what is it used for ? Create a DaemonSet YAMLfile with a Pod template containing an Nginx container in openshift and verify the number of pods. Using minikube, Taint the Minikube node with a specific key-value pair ‘color=red’to simulate a tainted node. Create a pod with toleration ‘color=blue’ and notice what is the status of the pod, change the toleration to ‘color=red’and notice what will happen. Make a Comparison between Taint & Toleration & Node Affinity.has context menu

## PART1: What is Daemonset?
- A DaemonSet is a type of workload resource that ensures a copy of a specific pod runs on all (or some) nodes in a cluster. DaemonSets are particularly useful for deploying infrastructure-related pods that need to be present on every node, such as log collection daemons, monitoring agents, or networking components.

## What is Daemonset used for ?
- **Monitoring**: Deploying monitoring agents on each node to gather metrics.

- **Logging**: Running log collection agents on every node to collect logs from all applications.

- **Networking**: Managing networking components like DNS services, overlay network components or network policy controllers.

- **Security**: Deploying security agents that need to run on all nodes for compliance or monitoring purposes.

## PART2

## Step1: Build a Daemonset 

- create DaemonSet YAML file with a Pod template containing an Nginx container

- Apply the Daemonset to the Cluster

```
oc apply -f nginx.yml
```

- Verify the number of Pods


  

- 
