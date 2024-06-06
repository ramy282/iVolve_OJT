# Lab 16: Source to image (S2I) Workflow
## Objective:
- Use Source-to-Image to build container images directly from application source code. Deploy an application using the S2I workflow.

- Clone the HTML application repository from GitHub: https://github.com/IbrahimmAdel/html.git

- Create a BuildConfig in OpenShift to build the HTML application using the Nginx builder image. Name the BuildConfigmy-html-app.

- Start the build process for the BuildConfigmy-html-app.

- View the build logs and monitor the progress.

- Once the build is complete, expose the service and access the website.


## PART1
## What is the Build and Build Config in OpenShift?

### 1- Build 
A Build in OpenShift represents an instance of the build process. It involves taking source code, transforming it into a runnable artifact (such as a Docker image), and pushing that artifact to a registry. Builds in OpenShift can be triggered manually, automatically based on changes in source code repositories, or based on updates to dependencies. 
 its Strategy:

 1- **Source to image (S2I)**:This strategy takes application source code and produces a runnable image by injecting the source into a pre-defined builder image that already has the required runtime environment.

 2- **Pipeline Build**: uses Jenkins pipelines to define and execute the build process. It integrates Jenkins with OpenShift to provide complex build workflows.

 4- **Docker Build**: uses a Dockerfile to define the build process. The Dockerfile specifies how to assemble the application into a container image.

 5- **Custom Build**: allows you to define custom logic for building the image, which can be useful for non-standard build processes.

### 2- BuildConfig: 
A BuildConfig is an OpenShift resource that defines how to run a build.

- It includes various parameters and settings that control the build process, such as:

1- **Source Repository**: Specifies where the source code resides.

2- **Build Strategy**: Specifies the type of build strategy to use (e.g., S2I, Docker, Custom, Pipeline).

3- **Triggers**: Defines conditions that automatically start new builds, such as changes to the source code repository, image changes, or configuration changes.

4- **Output**: Specifies where to push the resulting image (e.g., an image registry).

5- **Environment Variables**: Defines any environment variables required during the build process.

6- **Secrets and ConfigMaps**: Provides any required secrets or configurations.

## PART2:

## Step1: Clone the application on your local machine

- to clone the application

```
git clone https://github.com/IbrahimmAdel/html.git
cd html
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/be4ebfa4-0bfc-4089-8aec-29fac694d61f)

## Step2: Create BuildConfig File

- Create BuildConfig YAML file on your namesapce

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/4999b9c6-604d-4767-8d7d-8ca9501225e6)


##  Step3: Create A New Build for your application 

- To Build you application on your cluster 

```
oc new-build --name=my-html-app --binary --image-stream=nginx:latest
```


## Step4: Verify the Reasource 

- Before start building the application you need to verify that there is a running pod, svc of your app and buildconfig

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/89eb90af-205a-4fc7-a3d5-8a7ba101c571)

## Step5: Start build your application

- to push build your application source on your OpenShit cluster
```
oc start-build my-html-app --from-dir=. --follow
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/dd4c759c-72dd-413e-bd9a-0baf85b1b767)
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/2eb7920a-65e7-4f27-a55a-58c9b91943d5)


- view the logs

```
oc logs -f bc/my-html-app
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/ccd84d87-2600-483f-8b41-e30e6171d63c)
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/a7b665d5-cfb1-4bf1-9f1c-91ad70abfe9d)

## Step6: Deploy the application 

- to build the application
```
oc new-app my-html-app
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/032c9fab-6217-4339-85f7-e43acba80476)

## Step7: Expose the Service and Access you application 

- to create a route and make the application

```
oc expose svc/my-html-app
```

- to access your application, copy the URL under HOST/PORT

```
oc get route
```
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/7d05ec9c-314e-4f93-81dd-7b183e1c9f2b)

## Step8 : Verify your application 

- paste the copied URL on your browser

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/a73c1f72-66f0-46b7-8ee0-f041ef15cd16)

  
