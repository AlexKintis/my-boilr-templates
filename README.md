<h1 align=center>My boilr templates</h1>

This repository contains a collection of templates designed for various projects, including Jenkins, Docker<!--, Kubernetes, and more -->. These templates are created to be used with [Boilr](https://github.com/tmrts/boilr), a project scaffolding tool that helps you rapidly create project structures.

<div align="center">
<img src="https://github.com/AlexKintis/my-boilr-templates/blob/2f924bbf68461aaa44ad14c727cdd90f29b91595/Images/img.png" width="45%" alt="Main window">
</div>

# Table of Contents

<!-- - [Introduction](#introduction) -->
- [Templates](#templates)
  - [Jenkins](#jenkins)
  - [Docker](#docker)
  - [Javascript](#javascript)
  <!--- [Ansible](#ansible)-->
  <!--- [Kubernetes](#kubernetes)-->
  <!--- [Terraform](#terraform)-->
- [Usage](#usage)
<!--- [Contributing](#contributing)-->
<!--- [License](#license)-->
<!--- [Contact](#contact)-->

<!--## Introduction-->

<!--This repository is a comprehensive resource for high-quality templates tailored for various project needs. Each template is crafted to ensure easy customization and integration into your workflow, helping you save time and avoid common setup pitfalls. These templates are designed to be used with Boilr, making project setup faster and more efficient.-->

# Templates

## Jenkins

- **Jenkins Pipeline Template**: A ready-to-use Jenkins pipeline template for CI/CD processes.
<!--- **Multibranch Pipeline**: Template for setting up multibranch pipelines in Jenkins.-->
<!--- **Jenkins Configuration as Code (JCasC)**: Template for managing Jenkins configuration using YAML files.-->

## Docker

- **Docker Compose (DOES not work)**: Template for defining and running multi-container Docker applications using Docker Compose.
- **Docker Image Wrapper Script Template**: Script template which is for building and wrapping a docker image and executing it as an "host level" command.

    For example, This is the command that will be executed inside the container:

    ```bash
    docker run --network="host" --rm -v $(pwd):/pwd my-command <ARGS>
    ```

    The script will be like this (which will have the same effect as the command above):

    ```bash
    my-command-wrapper.sh <ARGS>
    ```

    > NOTE: The `Dockerfile` should have the following structure in order to work properly:

    ```Dockerfile
    FROM image:tag

    # Do what you have to do to build the image
    # Maybe export to the path the desired command
    # For example:
    ENV PATH=$PATH:/the/path/to/my-command

    # Create a directory to mount the host's directory
    RUN mkdir -p /pwd
    # Set the working directory to the mounted directory
    WORKDIR /pwd

    # And then add as an entrypoint the command that will be executed
    ENTRYPOINT [ "my-command" ]
    ```

## Javascript

- **Typescript NodeJS Template**: A template for setting up a Node.js project with TypeScript.

    This template will have the following structure:

    ```plaintext
    .
    ├── .eslintrc.json  <-- ESLint configuration file
    ├── .gitignore      <-- Git ignore file
    ├── package.json    <-- Node.js package file
    ├── src
    │   └── app.ts      <-- Main TypeScript file
    └── tsconfig.json   <-- TypeScript configuration file
    ```

    By applying the above template you will have a ready-to-use typescript to node project which you will can run with the following commands:

    ```bash
    # This will run (npx tsc)
    npm run build
    ```

    and then run the compiled javascript file with:

    ```bash
    # This will run (node dist/src/app.js)
    npm run exec 
    ```

<!--- **Dockerfile Template**: A basic Dockerfile template for building Docker images.-->
<!--- **Docker Swarm**: Template for setting up a Docker Swarm cluster.-->

<!--### Ansible-->

<!--- **Playbook Template**: A basic template for writing Ansible playbooks.-->
<!--- **Role Template**: Template for creating reusable Ansible roles.-->
<!--- **Inventory Template**: Template for managing Ansible inventory files.-->

<!--### Kubernetes-->

<!--- **Kubernetes Deployment**: A template for deploying applications on Kubernetes.-->
<!--- **Helm Chart**: Template for creating Helm charts to manage Kubernetes applications.-->
<!--- **Kustomize**: Template for customizing Kubernetes configurations using Kustomize.-->

<!--### Terraform-->

<!--- **AWS Infrastructure**: A Terraform template for setting up AWS infrastructure.-->
<!--- **Azure Infrastructure**: Template for provisioning Azure resources using Terraform.-->
<!--- **GCP Infrastructure**: Template for managing Google Cloud Platform resources with Terraform.-->

# Usage

To use any of the templates in this repository with Boilr:

1. **Install Boilr** (if not already installed):

   ```bash
    go install github.com/tmrts/boilr@latest
   ```

2. **Clone the repository**:

   ```bash
   git clone https://github.com/AlexKintis/my-boilr-templates.git
   ```

3. **Navigate to the template directory**:

   ```bash
   cd ./{template-category}
   ```

4. **Add the template to Boilr**:

   ```bash
   boilr template save {template-path} {template-name}
   ```

5. **Use the template**:

   ```bash
   boilr template use {template-name} {target-directory}
   ```

6. **Customize the generated project** according to your needs.
