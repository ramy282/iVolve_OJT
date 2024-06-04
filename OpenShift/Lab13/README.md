# Lab13 : Multi-Container Application 

## Objective: Create a deployment for Jenkins with an init container that sleeps for 10 seconds before the Jenkins container starts. Use readiness and liveness probes to monitor Jenkins. Create a NodePort service to expose Jenkins. Verify that the init container runs successfully and Jenkins is properly initialized. What is the differnet between readiness & liveness, init & sidecar container.

## PART1

## Step1: Build The Deployment

- Build the jenkins deployment YAML file

- add init container to sleep 10s before the Jenkins start

## Step2: Build NodePort Service to expose jenkins 

- Build NodePort Service to expose jenkins using NodePort 30000

## Step3: Apply the Deployment and Service

- Apply the Deployment and Service YAML files.

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/e12f1b52-aad2-4365-88d0-d9715f9fbfe3)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/86489f44-95f6-4b61-9dac-626011e348c1)

- Note: The status of the pod is PodInitializing bec. the init container sleep 10s

- After 10s

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/9d9597f1-3993-4a60-93e2-cb9992eadaa0)

## Step4: Verify the init Container and Jenkins Initialization

- Check init container logs

```
kubectl logs jenkins-deployment-68796cb6cc-tjzjj -c init-sleep ##pod-name
```

- Check jenkins logs

```
kubectl logs jenkins-deployment-68796cb6cc-tjzjj -c jenkins
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/62ad430e-f1dd-4408-b5e7-0e615b98a5e7)

- Access Jenkins using NodePoet 30000

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/b5a739cb-7ca7-4dd0-951b-ad92d328c0b2)

## PART2

## What is the differnet between readiness & liveness ?
