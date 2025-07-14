# RoR Application Deployment on AWS using Terraform

## Project Overview

This Ruby on Rails (RoR) application is deployed using Infrastructure as Code (Terraform) and AWS CLI. The deployment is streamlined with Makefile commands.

All AWS resources (ECS, EC2, RDS, S3, etc.) are provisioned in private subnets for enhanced security. The only publicly accessible component is the Application Load Balancer (ALB). The ECS service runs using the **bridge** network mode.

---

## Prerequisites

Ensure the following are installed and configured:

- AWS CLI (latest version)
- Docker version 28.3.2
- Docker Compose version 1.29.2
- Terraform version v1.12.2
- Make (latest version)

---

## Deployment Stages

### 1. Build & Push Docker Images

- Docker images for the Rails app and Nginx are built and pushed to AWS Elastic Container Registry (ECR).

### 2. Provision AWS Infrastructure

Terraform provisions the following resources:

- VPC
- IAM roles and policies
- RDS PostgreSQL database
- S3 bucket
- Launch Template
- Target Group
- Application Load Balancer (ALB)
- ECS Task Definition
- ECS Cluster
- ECS Service
- Capacity Provider
- CloudWatch Log Group

---

## Deployment Steps

1. **Install and configure all prerequisites.**

2. **Export AWS credentials** via `aws configure` or environment variables.

3. **From the project root directory**, run:

   ```bash
   make ecr-publish
   ```

   This command builds and pushes the Docker images to ECR.

4. **Verify:**

   - Docker images are built locally
   - Tagged correctly
   - Uploaded to the correct ECR repositories (`rails_app`, `web_server`)

5. **Update variables** in `terraform.tfvars` as required.

6. **Navigate to the infrastructure directory and run:**

   ```bash
   make init
   make plan
   ```

7. **Review the Terraform plan output.** Once verified, run:

   ```bash
   make apply
   ```

8. **Note:** ALB DNS will be output at the end of the deployment.

---

## Architecture Diagram

Refer to the included image: `RoR_Architecture_Diagram.png`

---

## License

This project is licensed for the purpose of technical evaluation and demonstration.
