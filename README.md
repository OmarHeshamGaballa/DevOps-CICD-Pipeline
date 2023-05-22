# DevOps-CICD-Pipeline

## Prerequisites


### Creating 3 EC2 instances

**Jenkins** (ubuntu & t2.micro)
   - Install jenkins on this instance, You can use this guide from [here](https://www.jenkins.io/doc/book/installing/linux)
   
**Ansible**  (ubuntu & t2.micro) 
   - Install Ansible & Docker on this instance, [Asnible installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)&[Docker installation guide](https://docs.docker.com/engine/install/ubuntu/)
   
 **K8S**     (ubuntu & t2.meduim)
   - Install minikube & Docker on this instance, [Docker installation guide](https://docs.docker.com/engine/install/ubuntu/) & [minikube installation guide](https://minikube.sigs.k8s.io/docs/start/)



## Project Description

![project](https://github.com/OmarHeshamGaballa/DevOps-CICD-Pipeline/assets/122731503/e79c97bb-8373-41aa-88cb-2fdf00ed2bb1)

1- As shown in figure we are using Jenkins to build CI/CD pipeline which is a series of steps that must be performed in order to deliver a new version of software. CI/CD pipelines are a practice focused on improving software delivery throughout the software development life cycle via automation. Whenever developer is committing and pushing to github repository, The Jenkins server will be triggered to start the pipeline.

2- Pipeline which we created will start the first stage that is going to clone the github repo and apply the new changes to workload through remaining steps.

3- The next stage will start by sneding github repo files over ssh to Ansible server, In our case it will contain Dockerfile that is going to be used to build our DockerImage.

4- Ansible will start Building the image using Dockerfile, tagging the image with latest version and pushing it to my Dockerhub Account

5- Jenkins will also send files through ssh to My K8S cluster to Makesure that Deployment.yml and service.yml is there to be capable of creating my webserver deployment and expose it using the LoadBalancer Service.

6- The last stage is to run Ansible-playbook which is going to configure my k8s cluster and create mywebserver deployment and cluster



## Testing Pipeline




https://github.com/OmarHeshamGaballa/DevOps-CICD-Pipeline/assets/122731503/a3736158-ed55-40ce-8f6c-ad3f87acb80f




