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
A BuildConfig (Build Configuration) is an OpenShift resource that defines how to run a build.

- It includes various parameters and settings that control the build process, such as:

1- **Source Repository**: Specifies where the source code resides.

2- **Build Strategy**: Specifies the type of build strategy to use (e.g., S2I, Docker, Custom, Pipeline).

3- **Triggers**: Defines conditions that automatically start new builds, such as changes to the source code repository, image changes, or configuration changes.

4- **Output**: Specifies where to push the resulting image (e.g., an image registry).

5- **Environment Variables**: Defines any environment variables required during the build process.

6- **Secrets and ConfigMaps**: Provides any required secrets or configurations.

## PART2:

