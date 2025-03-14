terraform {

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "a_iakimenko"

    workspaces {
      name = "base"
    }
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.0"
    }
  }
}
