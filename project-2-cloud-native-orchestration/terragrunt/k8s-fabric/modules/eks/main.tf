# modules/eks/main.tf
# Provisions EKS cluster with parity-aligned configuration

terraform {
  required_version = ">= 1.5.0"

  #backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
  }
}


provider "aws" {
  region = "us-east-1"

  access_key = "mock"
  secret_key = "mock"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  skip_region_validation = true
}

# Data sources
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

# IAM Role for EKS Cluster
resource "aws_iam_role" "eks_cluster" {
  name               = "eks-cluster-role-${var.env}"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = {
    Environment = var.env
    ManagedBy   = "Terragrunt"
    Parity      = "enforced"
  }
}

# IAM Role for EKS Node Group
resource "aws_iam_role" "eks_nodes" {
  name = "eks-node-role-${var.env}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# Attach policies to node role
resource "aws_iam_role_policy_attachment" "node_policy" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ])

  policy_arn = each.value
  role       = aws_iam_role.eks_nodes.name
}

# VPC for EKS
resource "aws_vpc" "main" {
  cidr_block           = var.cidr_range
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name                                        = "eks-vpc-${var.env}"
    Environment                                 = var.env
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

# Subnets (Public + Private)
resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_range, 4, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    "Name"                                      = "eks-private-${var.env}-${count.index}"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}

resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.cidr_range, 4, count.index + 10)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "eks-public-${var.env}-${count.index}"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "eks-igw-${var.env}"
  }
}

# EKS Cluster
resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  version  = var.k8s_version
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids              = concat(aws_subnet.private[*].id, aws_subnet.public[*].id)
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  depends_on = [
    aws_iam_role_policy_attachment.cluster_policy,
  ]

  tags = {
    Environment = var.env
    Parity      = "enforced"
  }
}


resource "aws_iam_role_policy_attachment" "cluster_policy" {
  role       = aws_iam_role.eks_cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# EKS Node Group
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "node-group-${var.env}"
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = aws_subnet.private[*].id

  instance_types = var.node_pool_instance_types
  ami_type       = var.node_os == "ubuntu-22.04" ? "AL2_x86_64" : "AL2_x86_64"

  scaling_config {
    desired_size = var.node_pool_desired_size
    max_size     = var.node_pool_max_size
    min_size     = var.node_pool_min_size
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    "environment" = var.env
    "node-pool"   = "default"
  }

  tags = {
    Environment = var.env
    Parity      = "enforced"
  }
}

# Helm Provider (for add-ons)
provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.main.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.main.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.main.name]
    }
  }
}

provider "kubernetes" {
  host                   = aws_eks_cluster.main.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.main.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.main.name]
  }
}

# Calico CNI (if not using AWS VPC CNI)
resource "helm_release" "calico" {
  count            = var.cni_plugin == "calico" ? 1 : 0
  name             = "calico"
  repository       = "https://docs.tigera.io/calico/charts"
  chart            = "tigera-operator"
  version          = var.calico_version
  namespace        = "tigera-operator"
  create_namespace = true

  values = [
    yamlencode({
      installation = {
        kubernetesProvider = "EKS"
      }
    })
  ]
}

# Metrics Server
resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  version    = "3.11.0"
  namespace  = "kube-system"

  values = [
    yamlencode({
      args = ["--kubelet-insecure-tls", "--kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname"]
    })
  ]
}

# External DNS
resource "helm_release" "external_dns" {
  name             = "external-dns"
  repository       = "https://kubernetes-sigs.github.io/external-dns/"
  chart            = "external-dns"
  version          = "1.13.1"
  namespace        = "external-dns"
  create_namespace = true

  values = [
    yamlencode({
      provider      = "aws"
      policy        = "sync"
      sources       = ["service", "ingress"]
      txtOwnerId    = var.env
      domainFilters = [var.dns_domain]
      extraArgs     = ["--aws-zone-type=public"]
    })
  ]
}

# Cert Manager
resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = "v1.13.2"
  namespace        = "cert-manager"
  create_namespace = true

  values = [
    yamlencode({
      installCRDs  = true
      replicaCount = 1
    })
  ]
}

# ArgoCD (for GitOps - Golden Path implementation)
resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "5.45.0"
  namespace        = "argocd"
  create_namespace = true

  values = [
    yamlencode({
      global = {
        domain = "argocd.${var.dns_domain}"
      }
      server = {
        ingress = {
          enabled = true
          annotations = {
            "kubernetes.io/ingress.class"    = "nginx"
            "cert-manager.io/cluster-issuer" = "letsencrypt-prod"
          }
          https = true
        }
      }
    })
  ]
}