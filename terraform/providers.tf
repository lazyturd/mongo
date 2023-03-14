terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
     kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.1"
    }
  }
}

provider "aws" {
  region     = "${var.region}"
}

provider "helm" {
  kubernetes {
    # config_path = "~/.kube/config"
    host                   = module.eks.cluster_endpoint
    # cluster_certificate = base64decode(module.eks.cluster_certificate)
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  }
}

provider "kubernetes" {
    host                   = module.eks.cluster_endpoint
    # cluster_certificate = base64decode(module.eks.cluster_certificate)
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}
