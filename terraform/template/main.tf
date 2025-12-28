# 1. Provider: The "Where"
provider "aws" {
  region = "{{ AWS_Region }}"
}

# 2. Locals: The "Internal Logic"
locals {
  project_name = "{{ ProjectName }}"
  environment  = "{{ Environment }}"
  common_tags = {
    Project     = local.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
  }
}

# 3. Data Source: The "Look-up"
# Fetches the latest Ubuntu AMI ID for the region
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "test_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "{{ InstanceType }}"

  tags = local.common_tags
}
