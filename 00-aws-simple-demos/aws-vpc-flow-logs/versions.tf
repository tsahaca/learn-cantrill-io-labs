terraform {

  required_version = ">= 1.0.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.47"
    }
//    kubernetes = {
//      source  = "hashicorp/kubernetes"
//      version = ">= 2.16.1"
//    }
//    helm = {
//      source  = "hashicorp/helm"
//      version = ">= 2.8.0"
//    }
//    kubectl = {
//      source  = "gavinbunney/kubectl"
//      version = ">= 1.14"
//    }
  }

  # ##  Used for end-to-end testing on project; update to suit your needs
  # backend "s3" {
  #   bucket = "terraform-ssp-github-actions-state"
  #   region = "us-west-2"
  #   key    = "e2e/eks-cluster-with-new-vpc/terraform.tfstate"
  # }
}
