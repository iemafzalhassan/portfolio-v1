---
title: "Retail Store Sample App - GitOps with EKS Auto Mode"
description: "Modern microservices architecture deployed on AWS EKS using GitOps principles with ArgoCD, Terraform, and GitHub Actions"
date: 2025-07-30
tags: ["AWS", "EKS", "GitOps", "ArgoCD", "Terraform", "Kubernetes", "Microservices", "DevOps", "CI/CD"]
categories: ["Infrastructure", "DevOps", "Cloud Native"]
author: "Afzal Hassan"
draft: false
---

## 🏪 Retail Store Sample App - GitOps with EKS Auto Mode

A comprehensive sample application demonstrating modern DevOps practices and GitOps principles on AWS EKS. This project showcases a complete retail store application with microservices architecture, automated deployment pipelines, and infrastructure as code.

### 🎯 Project Overview

This retail store application is designed to illustrate various concepts related to containers on AWS, presenting a complete e-commerce solution including product catalog, shopping cart, and checkout functionality. The project demonstrates modern DevOps practices including GitOps, Infrastructure as Code, and automated CI/CD pipelines.

### 🏗️ Architecture

#### **Application Services**
- **UI Service**: Java-based frontend application
- **Catalog Service**: Go-based product catalog API
- **Cart Service**: Java-based shopping cart API
- **Orders Service**: Java-based order management API
- **Checkout Service**: Node.js-based checkout orchestration API

#### **Infrastructure Stack**
- **Container Orchestration**: Amazon EKS with Auto Mode
- **GitOps**: ArgoCD for automated deployments
- **Infrastructure as Code**: Terraform for AWS resources
- **CI/CD**: GitHub Actions for automated builds
- **Container Registry**: Amazon ECR (both public and private)
- **Ingress**: NGINX Ingress Controller
- **SSL**: Cert Manager for automated certificates

### 🚀 Key Features

#### **Dual-Branch Deployment Strategy**
- **🌐 Public Application (Main Branch)**: Simple deployment with public images for demos and learning
- **🏭 Production (GitOps Branch)**: Full production workflow with automated CI/CD pipeline

#### **Modern DevOps Practices**
- **GitOps Workflow**: Automated deployments triggered by Git changes
- **Infrastructure as Code**: Complete AWS infrastructure managed with Terraform
- **Multi-Environment Support**: Separate configurations for development and production
- **Security Best Practices**: Private subnets, IAM roles, and security groups

### 🛠️ Technology Stack

| Category | Technology |
|----------|------------|
| **Cloud Platform** | AWS (EKS, ECR, VPC, IAM) |
| **Container Orchestration** | Kubernetes 1.23+ |
| **GitOps** | ArgoCD |
| **Infrastructure as Code** | Terraform |
| **CI/CD** | GitHub Actions |
| **Container Registry** | Amazon ECR |
| **Ingress Controller** | NGINX |
| **SSL/TLS** | Cert Manager |
| **Languages** | Java, Go, Node.js, TypeScript |

### 📊 Project Statistics

- **Repository**: [GitHub Repository](https://github.com/iemafzalhassan/retail-store-sample-app)
- **Language Distribution**: Java (65.4%), TypeScript (12.1%), HTML (9.3%), Go (4.8%)
- **Forks**: 6
- **License**: MIT-0

### 🔧 Implementation Highlights

#### **Phase 1: Core Infrastructure**
- VPC with public and private subnets
- Amazon EKS cluster with Auto Mode enabled
- Bastion host for secure cluster access
- Security groups and IAM roles

#### **Phase 2: Application Platform**
- ArgoCD for GitOps deployment
- NGINX Ingress Controller
- Cert Manager for SSL certificates
- Complete application deployment

#### **Automation Features**
- Automated image building and pushing to ECR
- GitOps-driven deployments with ArgoCD
- Infrastructure provisioning with Terraform
- Multi-environment deployment strategies

### 🎨 Professional Impact

This project demonstrates:
- **Enterprise-Grade Architecture**: Production-ready microservices setup
- **Modern DevOps Practices**: GitOps, Infrastructure as Code, automated pipelines
- **Cloud-Native Development**: Kubernetes-native application design
- **Scalability**: Auto-scaling capabilities with EKS Auto Mode
- **Security**: Best practices for container security and access control

### 🔗 Related Resources

- **Repository**: [GitHub - Retail Store Sample App](https://github.com/iemafzalhassan/retail-store-sample-app)
- **Documentation**: Comprehensive setup and deployment guides
- **Branching Strategy**: Detailed CI/CD workflow documentation

---

*This project showcases the power of modern DevOps practices and GitOps principles in creating scalable, maintainable, and secure cloud-native applications.*
