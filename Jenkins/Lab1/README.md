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

## Step2: Configure your jenkins Master 

1- To run jenkins on a Docker container 
```
sudo docker run -p 8080:8080 -p 50000:50000 -d \
 -v jenkins_home:/var/jenkins_home \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v $(which docker):/usr/bin/docker jenkins/jenkins
```

2- Add oc token to jenkins's credintials 
  Manage jenkins >> credentials >> golbal >> Add Credentials >> Choose secret text and paste the oc-token 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/8ebe66e7-aa2c-4f05-b957-26a50c2670cb)

3- Add Github and DockerHub credentials in the same way but choose username and password 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/3d49c8c7-7ec2-4512-8962-5fe666a4a7d7)

## Step3: Clone your application 

1- Clone the application 
```
git clone https://github.com/IbrahimmAdel/app.git
```

2- update DockerFile 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/d5744575-9699-409a-8947-e011996ceb8e)

## Step3: Create Jenkinsfile
- use shared-library
  ```
  @Library('shared-library')_
  ```
  
- Use jenkins salve
```
pipeline {
    agent { 
        // Specifies a label to select an available agent
         node { 
             label 'slave1'
         }
    }
```

- Define the statages (Test, Build Docker Image , push Docker Image and Deploy on OpenShift Cluster )
```
 stages {

        stage('Test') {
            steps {
                script {
                      
                	    echo "Running Unit Test..."
			            // sh 'chmod 744 ./gradlew'
			            // sh './gradlew clean test'
                        }
                    }
        	    }
    	    }
	}
        stage('Build Docker Image') {
            steps {
                script {
                	// Navigate to the directory contains Dockerfile
                 		buildDockerImage("${imageName}")
                }
            }
        }
        stage('push Docker Image') {
            steps {
                script {
                	// Navigate to the directory contains Dockerfile
                 		pushDockerImage("${dockerHubCredentialsID}", "${imageName}")
                }
            }
        }


        stage('Deploy on OpenShift Cluster') {
            steps {
                script { 
				deployToOpenShift("${openshiftCredentialsID}", "${openshiftClusterURL}", "${openshiftProject}", "${imageName}")
                }
            }
        }
    }
```

- Define the post action of the pipline
```
 post {
        success {
            echo "${JOB_NAME}-${BUILD_NUMBER} pipeline succeeded"
        }
        failure {
            echo "${JOB_NAME}-${BUILD_NUMBER} pipeline failed"
        }
    }

```

## Step4: Create The shared Library 

[Shared-library](https://github.com/ramy282/shared-Library.git)

- buildDockerImage.groovy
```
def call(String imageName) {
    echo "Building Docker Image: ${imageName}"
    sh "docker build -t ${imageName} ."
}
```

- deployToOpenShift.groovy
```
def call(String openshiftCredentialsID, String openshiftClusterURL, String openshiftProject, String imageName) {
    withCredentials([string(credentialsId: openshiftCredentialsID, variable: 'OPENSHIFT_TOKEN')]) {
        sh """
            oc login ${openshiftClusterURL} --token=${OPENSHIFT_TOKEN}
            oc project ${openshiftProject}
            oc new-app ${imageName}
            oc expose svc/${imageName}
        """
    }
}
```

- pushDockerImage.groovy
```
def call(String dockerHubCredentialsID, String imageName) {
    withCredentials([usernamePassword(credentialsId: dockerHubCredentialsID, passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
        sh "echo ${DOCKERHUB_PASSWORD} | docker login -u ${DOCKERHUB_USERNAME} --password-stdin"
        sh "docker push ${imageName}"
    }
}
```

## Step5: Configure Shared library on Jenkins-Master

- Manage jenkins >> system
in Global pipline section
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/08b7c5be-3aa3-4473-97d7-f764adaf853b)
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/871a4748-bc61-4f6e-a48d-610aecb2c02c)
    

## Step6: Create Jenkins Deployment and service 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/47efe0ce-e1ae-4512-b7f1-b5e333103e06)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/e8e425b1-c66e-4ea7-8c3f-e867a9b0d19d)


