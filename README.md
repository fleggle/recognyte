# Nexus on Kubernetes

This repository contains a YAML configuration file that can be used to deploy a Nexus application on a Kubernetes cluster. The configuration includes a Service, Persistent Volume, and Deployment for Nexus, as well as a Persistent Volume Claim.

## Requirements

Before you can deploy the Nexus application, you will need the following:

- A Kubernetes cluster with `kubectl` installed and configured
- A container registry that can be used to store Docker images (such as Google Container Registry or Docker Hub)

## Deployment

To deploy the Nexus application, follow these steps:

1. Clone this repository to your local machine:

`git clone <repository-url>`

2. If you are using a templating tool such as Helm or Kustomize, modify the YAML configuration files to fit your use case.

3. Build the Nexus Docker image with the Cloud Storage plugin installed. For example, using the `Dockerfile` in this repository:

`docker build -t my-nexus-image .`

4. Push the Docker image to your container registry:

`docker push <registry-url>/my-nexus-image:<image-tag>`

5. Apply the Kubernetes configuration using `kubectl apply`:

`kubectl apply -f <path-to-yaml-file>`

This will create a Nexus Deployment, Service, Persistent Volume, and Persistent Volume Claim in your Kubernetes cluster. The Nexus application will be accessible at the external IP address of the LoadBalancer service created by the deployment.

## Updating the application

To update the Nexus application, follow these steps:

1. Modify the YAML configuration files to include the changes you want to make.

2. Build the updated Docker image and push it to your container registry with a new image tag.

3. Update the image tag of the `nexus` container in the Nexus Deployment using `kubectl set image`:

`kubectl set image deployment/nexus-deployment nexus=<registry-url>/my-nexus-image:<new-image-tag>`

This will update the Nexus Deployment to use the new Docker image with the specified image tag.

I hope this helps! Let me know if you have any other questions.



