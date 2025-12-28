# Terraform Test Project: {{ .ProjectName }}

This project was bootstrapped using a `boilr` template. It provides a standardized environment for testing Terraform resources, specifically focusing on AWS.

## 🚀 Purpose

The goal of this configuration is to demonstrate and test three core Terraform concepts:

1. **Providers:** Configured for the `{{ .AWS_Region }}` region.
2. **Data Sources:** Dynamically fetches the latest Ubuntu 20.04 AMI.
3. **Locals:** Standardizes tagging and naming conventions across the project.

## 🛠 Project Details

- **Environment:** {{ .Environment }}
- **Instance Type:** {{ .InstanceType }}
- **Default Region:** {{ .AWS_Region }}

## 📂 Project Structure

This template follows the Terraform standard layout to keep logic, variables, and outputs separated:

| File | Role | Description |
| :--- | :--- | :--- |
| `main.tf` | **Logic** | The primary configuration file. It contains the **Provider** setup, **Data** sources to fetch AMIs, and **Locals** for tag management. |
| `variables.tf` | **Inputs** | Defines the "knobs and dials" of your module. It allows you to customize things like the instance name without touching the core logic. |
| `outputs.tf` | **Results** | Defines what information Terraform prints to the console after a successful `apply` (e.g., the Instance IP). |
| `terraform.tfvars` | **Values** | (Optional) A place to hardcode specific variable values for this environment to avoid manual typing during prompts. |

---

## 🏗 Key Concepts in this Template

### 1. Providers (`provider "aws"`)

Tells Terraform which API to talk to. In this project, it's configured for **AWS** using the region `{{ .AWS_Region }}`.

### 2. Locals (`locals { ... }`)

Used here to create a `common_tags` map. Instead of writing the same tags for every resource, we define them once in `locals` and reference them everywhere as `local.common_tags`.

### 3. Data Sources (`data "aws_ami"`)

Instead of hardcoding an AMI ID (which changes frequently), we use a `data` block to ask AWS: *"What is the latest ID for an Ubuntu 20.04 image?"* This makes your code more portable across different regions.

## 📋 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed (v1.0+)
- AWS CLI configured with valid credentials.

## 📖 How to Use

1. **Initialize:** Prepare the working directory and download providers.

    ```bash
    terraform init
    ```

2. **Plan:** Preview the actions Terraform will take.

    ```bash
    terraform plan
    ```

3. **Apply:** Deploy the test instance.

    ```bash
    terraform apply
    ```

4. **Cleanup:** Always remember to destroy your test resources to avoid unnecessary costs.

    ```bash
    terraform destroy
    ```

---
*Generated via boilr on $(date)*
