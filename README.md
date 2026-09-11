# 🚀 Highly Available Web Infrastructure on AWS

![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![Terraform](https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-7B42BC?logo=terraform)
![Jenkins](https://img.shields.io/badge/Jenkins-CI%2FCD-D24939?logo=jenkins)
![GitHub](https://img.shields.io/badge/GitHub-Version%20Control-black?logo=github)
![DevOps](https://img.shields.io/badge/Domain-DevOps-blue)

## 📌 Project Overview

This project demonstrates the design and deployment of a **Highly Available Web Infrastructure on AWS** using **Terraform as Infrastructure as Code (IaC)**.

The infrastructure is designed to provide:

- High Availability
- Scalability
- Fault Tolerance
- Network Isolation
- Infrastructure Automation
- Reusable Terraform Modules
- Environment-based Infrastructure Management
- CI/CD-based Terraform Deployment

The infrastructure is managed through Terraform instead of manually creating AWS resources, making the deployment **repeatable, consistent, and version controlled**.

Jenkins is also integrated to automate the Terraform infrastructure deployment workflow.

---

## 🏗️ Architecture

```text
                         🌐 INTERNET
                              |
                              v
                    +-------------------+
                    |  Application      |
                    |  Load Balancer    |
                    +---------+---------+
                              |
                +-------------+-------------+
                |                           |
                v                           v
        +---------------+           +---------------+
        | Availability  |           | Availability  |
        | Zone - A      |           | Zone - B      |
        |               |           |               |
        |     EC2       |           |     EC2       |
        |   Instance    |           |   Instance    |
        +-------+-------+           +-------+-------+
                |                           |
                +-------------+-------------+
                              |
                              v
                    +-------------------+
                    |       AWS VPC     |
                    +-------------------+
```

### 🔄 CI/CD Infrastructure Flow

```text
Developer
    |
    v
GitHub Repository
    |
    v
Jenkins
    |
    +----------------------+
    | Terraform Pipeline   |
    +----------------------+
              |
              v
       terraform init
              |
              v
       terraform validate
              |
              v
        terraform plan
              |
              v
        terraform apply
              |
              v
          AWS Cloud
```

---

# ☁️ AWS Services

The project uses AWS services and concepts such as:

| AWS Service | Purpose |
|---|---|
| Amazon VPC | Provides isolated cloud networking |
| Subnets | Divides the network into logical segments |
| Availability Zones | Provides fault tolerance and high availability |
| EC2 | Runs application/web workloads |
| Application Load Balancer | Distributes incoming traffic |
| Auto Scaling | Provides scalability and maintains capacity |
| Security Groups | Controls inbound and outbound traffic |
| Internet Gateway | Provides internet connectivity |
| NAT Gateway | Provides outbound internet access for private resources |

---

# 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| AWS | Cloud Infrastructure |
| Terraform | Infrastructure as Code |
| Jenkins | CI/CD Automation |
| Git | Version Control |
| GitHub | Source Code Management |
| Linux | Server and automation environment |

---

# 📂 Project Structure

```text
Highly-Available-Web-Infrastructure-on-AWS/
│
├── .github/
│
├── terraform_project/
│   │
│   ├── ENV/
│   │   └── dev/
│   │
│   ├── Module/
│   │
│   └── jenkinsfile
│
└── README.md
```

### Directory Description

#### `ENV/dev`

Contains the Terraform configuration for the development environment.

```text
ENV/dev/
```

This approach makes it possible to create additional environments such as:

```text
ENV/
├── dev/
├── staging/
└── production/
```

#### `Module`

Contains reusable Terraform modules.

Modules help keep the infrastructure:

- Modular
- Reusable
- Maintainable
- Scalable
- Easy to manage

#### `jenkinsfile`

Contains the Jenkins pipeline configuration used to automate Terraform operations.

---

# 🧩 Terraform Module Design

Terraform modules are used to divide infrastructure into reusable components.

Instead of maintaining the complete infrastructure in a single Terraform configuration, resources can be organized into logical modules.

Example:

```text
Module/
│
├── networking/
├── compute/
├── security/
└── ...
```

This provides better code organization and allows the same infrastructure components to be reused across different environments.

---

# 🌎 Environment Management

The project uses environment-based Terraform configuration.

Currently:

```text
ENV/
└── dev/
```

The same structure can later be extended:

```text
ENV/
├── dev/
├── staging/
└── production/
```

This allows different environments to have their own infrastructure configuration and variables.

---

# 🔐 Security

Security is an important part of the infrastructure design.

The project uses AWS security and networking mechanisms such as:

- Security Groups
- Public and Private Subnets
- Controlled inbound traffic
- Controlled outbound traffic
- IAM-based AWS authentication
- Network isolation

### 🔒 Security Best Practices

Sensitive credentials should never be stored directly inside the GitHub repository.

Do not commit:

```text
❌ AWS Access Keys
❌ AWS Secret Keys
❌ Passwords
❌ Private SSH Keys
❌ Sensitive Terraform variables
```

Recommended solutions include:

```text
AWS IAM Roles
AWS Secrets Manager
AWS Systems Manager Parameter Store
Environment Variables
Terraform sensitive variables
```

---

# 🔄 Jenkins CI/CD Pipeline

Jenkins is used to automate the Terraform workflow.

The pipeline follows this process:

```text
Git Push
   |
   v
Jenkins Trigger
   |
   v
Terraform Init
   |
   v
Terraform Validate
   |
   v
Terraform Plan
   |
   v
Terraform Apply
   |
   v
AWS Infrastructure
```

### Pipeline Benefits

- Automated infrastructure deployment
- Reduced manual errors
- Consistent deployments
- Terraform validation
- Repeatable infrastructure provisioning
- Faster deployment process

---

# 🚀 Deployment

## 1. Clone the Repository

```bash
git clone https://github.com/tushar-2902/Highly-Available-Web-Infrastructure-on-AWS.git
```

Move into the Terraform project:

```bash
cd Highly-Available-Web-Infrastructure-on-AWS/terraform_project/ENV/dev
```

---

## 2. Initialize Terraform

```bash
terraform init
```

Terraform downloads the required providers and initializes the working directory.

---

## 3. Format Terraform Code

```bash
terraform fmt -recursive
```

This formats Terraform files according to Terraform's standard formatting conventions.

---

## 4. Validate Terraform Configuration

```bash
terraform validate
```

This checks whether the Terraform configuration is syntactically valid.

---

## 5. Create Terraform Plan

```bash
terraform plan
```

This shows the infrastructure changes Terraform intends to make.

---

## 6. Deploy Infrastructure

```bash
terraform apply
```

Confirm the deployment:

```text
yes
```

Terraform will then create/update the required AWS resources.

---

## 7. Destroy Infrastructure

When the infrastructure is no longer required:

```bash
terraform destroy
```

Confirm:

```text
yes
```

> ⚠️ Use `terraform destroy` carefully because it can delete AWS resources.

---

# 📈 High Availability

High availability is achieved by distributing infrastructure across multiple **AWS Availability Zones**.

Instead of relying on a single compute resource, workloads can be distributed across multiple instances and Availability Zones.

### Benefits

### 🔹 Fault Tolerance

If one Availability Zone experiences an issue, resources in another Availability Zone can continue serving traffic.

### 🔹 Load Distribution

The Application Load Balancer distributes incoming requests between healthy backend instances.

### 🔹 Scalability

Auto Scaling can increase or decrease the number of EC2 instances based on workload requirements.

### 🔹 Improved Reliability

The infrastructure avoids depending on a single instance or Availability Zone.

---

# 📊 Infrastructure Workflow

```text
                    USER
                      |
                      v
                  INTERNET
                      |
                      v
             APPLICATION LOAD
                 BALANCER
                      |
          +-----------+-----------+
          |                       |
          v                       v
      EC2 - AZ A              EC2 - AZ B
          |                       |
          +-----------+-----------+
                      |
                      v
                    VPC
                      |
             AWS Networking
                      |
          +-----------+-----------+
          |                       |
       Public                   Private
       Subnets                  Subnets
```

---

# 💡 DevOps Concepts Demonstrated

This project demonstrates practical implementation of:

- Infrastructure as Code
- Terraform
- Terraform Modules
- AWS Cloud Architecture
- VPC Networking
- Public & Private Subnets
- Availability Zones
- Load Balancing
- Auto Scaling
- Security Groups
- CI/CD
- Jenkins
- Git
- GitHub
- Infrastructure Automation
- Environment Separation
- Cloud Infrastructure Management

---

# 🎯 Project Objectives

The primary objectives of this project are:

- Build a highly available AWS infrastructure
- Automate infrastructure provisioning using Terraform
- Implement reusable Terraform modules
- Separate infrastructure by environment
- Automate Terraform deployment through Jenkins
- Implement AWS networking best practices
- Improve infrastructure reliability
- Provide scalability and fault tolerance
- Follow Infrastructure as Code principles

---

# 🧪 Terraform Validation

Before applying infrastructure changes, the following commands can be used:

```bash
terraform fmt
terraform validate
terraform plan
```

Recommended workflow:

```text
terraform fmt
      ↓
terraform validate
      ↓
terraform plan
      ↓
terraform apply
```

This helps detect configuration issues before infrastructure changes are applied.

---

# 📚 Learning Outcomes

Through this project, I gained hands-on experience with:

- AWS infrastructure design
- Terraform configuration
- Terraform modules
- AWS networking
- VPC architecture
- Public and private subnet design
- Availability Zones
- Load balancing
- Auto Scaling
- Security Groups
- Jenkins CI/CD
- Git and GitHub
- Infrastructure automation
- Environment management
- DevOps best practices

---

# 🔮 Future Improvements

The project can be further enhanced with:

- [ ] Terraform Remote Backend
- [ ] Amazon S3 for Terraform State
- [ ] State Locking
- [ ] Staging Environment
- [ ] Production Environment
- [ ] HTTPS using AWS Certificate Manager
- [ ] Route 53 DNS
- [ ] CloudWatch Monitoring
- [ ] Prometheus
- [ ] Grafana
- [ ] AWS WAF
- [ ] IAM Role-based Authentication
- [ ] AWS Secrets Manager
- [ ] Docker Containerization
- [ ] Amazon EKS
- [ ] GitHub Actions
- [ ] Infrastructure Monitoring and Alerting

---

# ⭐ Key Features

```text
┌─────────────────────────────────────────┐
│       Highly Available Infrastructure   │
├─────────────────────────────────────────┤
│                                         │
│  ✓ AWS Cloud Infrastructure             │
│  ✓ Terraform Infrastructure as Code     │
│  ✓ Reusable Terraform Modules           │
│  ✓ Multi-AZ Architecture                │
│  ✓ Load Balancing                       │
│  ✓ Auto Scaling                         │
│  ✓ Network Isolation                    │
│  ✓ Security Groups                      │
│  ✓ Environment Separation               │
│  ✓ Jenkins CI/CD                        │
│  ✓ GitHub Version Control               │
│                                         │
└─────────────────────────────────────────┘
```

---

# 🏆 Project Highlights

This project demonstrates how modern DevOps practices can be used to build and manage cloud infrastructure.

The combination of:

```text
AWS
 +
Terraform
 +
Jenkins
 +
GitHub
```

creates an automated Infrastructure as Code workflow where infrastructure can be provisioned, modified, validated and deployed in a consistent manner.

---

# 👨‍💻 Author

## Tushar Mishra

**Cloud & DevOps Enthusiast**

GitHub:  
https://github.com/tushar-2902

Repository:  
https://github.com/tushar-2902/Highly-Available-Web-Infrastructure-on-AWS

---

# ⭐ Support

If you found this project useful or interesting, please consider giving the repository a ⭐.

It helps support and motivate further Cloud, DevOps and Infrastructure as Code projects.

---

## 📜 License

This project is created for **learning, experimentation and portfolio purposes**.
