<h1 align=center>My boilr templates</h1>

<p align="center">
  <strong>A collection of curated <a href="https://github.com/tmrts/boilr">Boilr</a> templates for rapid project scaffolding.</strong>
</p>

<div align="center">
  <img src="https://github.com/AlexKintis/my-boilr-templates/blob/main/Images/img.png" width="45%" alt="Main window">
</div>

---

## 📖 Introduction

This repository contains a comprehensive collection of high-quality templates tailored for various project needs. Each template is crafted to ensure easy customization and integration into your workflow, helping you save time and avoid common setup pitfalls. These templates are designed to be used with [Boilr](https://github.com/tmrts/boilr), making project setup faster and more efficient.

## 🗂️ Templates

### 🛠️ Jenkins
- **Jenkins Pipeline Template**: A ready-to-use Jenkins pipeline template for CI/CD processes.

### 🐳 Docker
- **Docker Compose Template**: Template for defining and running multi-container Docker applications. Includes a base `docker-compose.yml` with service definitions.
- **Docker Image Wrapper Script**: Script template for building and wrapping a docker image to execute it as a host-level command.
    > NOTE: The `Dockerfile` should have an `ENTRYPOINT` and a `/pwd` mount point to work correctly with the wrapper script.

### 📜 Ansible
- **Full Ansible Project**: A complete project structure including inventory, roles, playbooks, and configuration.
- **Ansible Wiki**: A template specifically for generating a `README.md` that documents core Ansible concepts.

### 📦 DevPod
- **DevPod Project**: Basic setup for [DevPod](https://devpod.sh/), enabling consistent development environments across teams.
- **DevPod Dockerfile**: A specialized template for using custom Dockerfiles with DevPod.

### 🐧 Linux
- **Linux Project Source Script**: A helper script (`source.sh`) providing standard functions like `deploy`, `start_project`, `stop_project`, `status`, and `cleanup`.

### ⚙️ Makefile
- **Generic Makefile**: A powerful, modular `Makefile` with built-in colorized output, help messages, and standard targets (`setup`, `build`, `test`, `run`, `clean`).

### ❄️ Nix
- **Nix Flake Template**: A template for setting up a modern Nix flake project with standard `run`, `build`, and `develop` outputs.

### 🌍 Terraform
- **AWS Infrastructure**: A starter template for AWS infrastructure including provider configuration, locals, and a sample Ubuntu instance.

### 💻 Javascript
- **Typescript NodeJS Template**: A complete setup for Node.js projects using TypeScript, including ESLint and predefined build/execution scripts.

---

## 🚀 Usage

To use any of these templates with Boilr:

1. **Install Boilr**:
   ```bash
   go install github.com/tmrts/boilr@latest
   ```

2. **Clone the repository**:
   ```bash
   git clone https://github.com/AlexKintis/my-boilr-templates.git
   ```

3. **Navigate to the template directory**:
   ```bash
   cd ./my-boilr-templates/{category}/{template-name}
   ```
   *(Note: For top-level templates like `makefile` or `nix`, just navigate to that directory.)*

4. **Add the template to Boilr**:
   ```bash
   boilr template save . {template-name}
   ```

5. **Use the template**:
   ```bash
   boilr template use {template-name} {target-directory}
   ```

---

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
