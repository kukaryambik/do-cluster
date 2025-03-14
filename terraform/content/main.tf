terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "a_iakimenko"

    workspaces {
      name = "content"
    }
  }

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.9.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

data "terraform_remote_state" "base" {
  backend = "remote"
  config = {
    hostname     = "app.terraform.io"
    organization = "a_iakimenko"
    workspaces = {
      name = "base"
    }
  }
}
