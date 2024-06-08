# Lab1: 
## Objective:
1- The pipeline is designed to build a Docker image of the application, push it to Docker Hub, and deploy it to an OpenShift cluster. 

2- The Jenkins pipeline leverages a master-slave architecture and utilizes a shared Jenkins library for modular and reusable pipeline code.

## Step1: Create A Service Account

1- Create A service account on your oc cluster 
```
oc create serviceaccount jenkins
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

[jenkinas-lab1](https://github.com/ramy282/Jenkins-lab1.git)

```
git clone https://github.com/IbrahimmAdel/app.git
```

2- update DockerFile 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/aa987a21-275b-4f48-bfb7-001db8f4e11b)

## Step3: Create Jenkinsfile
- use shared-library
```
@Library('shared-library')_
```
  
- Use jenkins salve
```
pipeline {
    agent any
    }
```

- Define the statages (Test, Build Docker Image , push Docker Image and Deploy on OpenShift Cluster )
```
 stages {

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

## Step7: Create a pipline 
1- Click New item

2- Enter pipline name and choose pipline

3- In pipline Defination section choose pipline script from SCM

4- in SCM choose git 

5- Enter repo URL and select your credentials

6- In Branch Spcifier Enter */master 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/b54750f3-35b0-4e30-803b-84d1cc547de3)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/7e1d0778-e75d-455f-9bd7-b6e2c4f2655f)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/ced84947-3575-4cbf-9511-50cec1d7fd71)

## Step8: Run the pipline 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/bbebb8ac-4e0b-462a-b448-14963ad4df28)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/c4addc4a-bc7c-4ee8-8f92-0c71297d0dbe)

## Step9: Create Jenkins-slave 

- Create an Ubnuntu EC2 instances type t3.small

- All ssh in Secuirty group

- Download Docker , java and openshift on EC2

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/6aa9e343-03ce-42da-8a08-59fa10c46b20)
  
```
# Update the package index
sudo apt-get update

# Install required packages
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package index again
sudo apt-get update

# Install Docker
sudo apt-get install -y docker-ce

# Start the Docker service
sudo systemctl start docker

# Enable Docker to start on boot
sudo systemctl enable docker

# Add ubuntu user to the docker group
sudo usermod -aG docker ubuntu

# Apply group membership (log out and log back in, or run this command)
newgrp docker

# Verify Docker installation
docker --version

# Update the package index
sudo apt-get update

# Install OpenJDK
sudo apt-get install -y openjdk-11-jdk

# Verify the Java installation
java -version

# Verify JAVA_HOME
echo $JAVA_HOME

# Connect to your EC2 instance
ssh -i your-key.pem ubuntu@your-ec2-public-dns

# Download the OpenShift CLI tarball
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz

# Extract the tarball
tar -xzvf openshift-client-linux.tar.gz

# Move the oc binary to /usr/local/bin
sudo mv oc /usr/local/bin/
sudo mv kubectl /usr/local/bin/ # if you want kubectl as well

# Verify the installation
oc version
```

## Step10: Add jenkins-slave Crediantials 

- Manage jenkins >> credentials >> golbal >> Add Credentials >> Choose ssh with a private key

- Add label jenkins-slave

- Enter jenkins private key and save   

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/13d29f3d-0c62-423b-a3f2-a458230d7250)

## Step11: Configure the jenkins-slave with master node

- Manage jenkins >> nodes >> new node

- Enter 'jenkins-slave' as a label

- under remote root directory enter '/home/ubuntu'

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/e9d983ec-ac7e-4733-abd6-ac418c0c3a4b)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/74a2e515-5496-499e-931c-031588f2fcb4)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/4e7130be-62e1-4b18-bb68-61139ea638c2)

## Step12: Create A pipline with jenkins-slave 

- Add pipline new item

- Give it Repo URL and Ubuntu credintials

 ![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/2fa712c3-a15a-4535-bf3f-831d7af2f3af)

**Build the pipline** 
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/66dafadd-ef07-41c7-87b2-5910fc167ff7)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/dfdee547-8c72-4c8b-8790-24ddf14ed83b)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/43e7010a-fe45-4f08-b631-1dcc5bb06cb2)

## Step12: Verify The Image is pushed on DockerHub 

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/12a92a64-f473-49fc-9fb3-ed289864a077)

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/94f18a72-d0c5-4fd0-84b7-527677dc40b2)
