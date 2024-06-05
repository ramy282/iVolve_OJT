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

![Screenshot from 2024-06-05 02-44-17](https://github.com/ramy282/iVolve_OJT/assets/60857262/a43f5d2f-7280-4003-9d30-b1110dbd4fc0)

## Step2: Taint the node

- Taint the Minikube node with a specific key-value pair ‘color=red’to simulate a tainted node.
  
```
kubectl taint nodes minikube color=red:NoSchedule
```

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/d5041e7f-3102-4e4e-ac87-62d9054843d5)

## Step3: Creat a pod

- Create a pod with a toleration of 'color=blue'

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod-blue
spec:
  containers:
  - name: nginx
    image: nginx:latest
  tolerations:
  - key: "color"
    operator: "Equal"
    value: "blue"
    effect: "NoSchedule"
```
 
- Check the pod status after toleration

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/75eba0aa-b418-433a-b42e-d82f9b8a19c9)

- **Note**: The Status of the Pod Pending state because it cannot schedule onto the tainted node.  

## Step4: Change the Toleration

- Change the toleration to 'color=red'

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/6abc8199-3335-4f7e-97d5-ffba3ed816c8)

## PART3: 

## Comparison between Taint, Toleration, and Node Affinity

| Feature            | Taint                                                                 | Toleration                                                              | Node Affinity                                                          |
|--------------------|-----------------------------------------------------------------------|-------------------------------------------------------------------------|------------------------------------------------------------------------|
| **Purpose**        | Used to repel pods from nodes unless they have matching tolerations.  | Used to allow pods to be scheduled on nodes with matching taints.        | Used to constrain which nodes a pod can be scheduled based on node labels. |
| **Definition**     | Applied to nodes to indicate that pods should not be scheduled unless they tolerate the taint. | Applied to pods to indicate that they can tolerate (or accept) specific taints on nodes. | Applied to pods to define rules about node labels for scheduling.        |
| **Key Components** | Key, Value, and Effect (`NoSchedule`, `PreferNoSchedule`, `NoExecute`) | Key, Value, Operator (`Equal`, `Exists`), Effect (`NoSchedule`, `PreferNoSchedule`, `NoExecute`) | RequiredDuringSchedulingIgnoredDuringExecution, PreferredDuringSchedulingIgnoredDuringExecution |
| **Effect**         | Prevents pods without matching tolerations from being scheduled on the node. | Allows pods to be scheduled on nodes with matching taints.                | Schedules pods on nodes that meet specific label criteria.                |
| **Example Use Cases** | - Keep certain nodes free of general workloads (e.g., for special hardware or specific roles). | - Allow specific pods to run on nodes with special hardware or constraints. | - Ensure pods are scheduled on nodes with specific characteristics (e.g., region, disk type). |
| **Behavior When Not Matched** | Pods are not scheduled on the tainted node.                 | Pods without matching tolerations are not scheduled on tainted nodes.     | Pods are not scheduled on nodes that do not meet the affinity criteria.   |


