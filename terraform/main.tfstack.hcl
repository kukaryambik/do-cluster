required_providers {
  random = {
    source  = "hashicorp/random"
    version = ">= 3.4.0"
  }
  digitalocean = {
    source  = "digitalocean/digitalocean"
    version = ">= 2.0"
  }
  helm = {
    source  = "hashicorp/helm"
    version = ">= 2.9.0"
  }
  kubectl = {
    source  = "gavinbunney/kubectl"
    version = ">= 1.7.0"
  }
}

provider "digitalocean" "do" {}
provider "random" "rand" {}
provider "helm" "helm" {
  config {
    kubernetes {
      host  = component.base.outputs.cluster_endpoint
      token = component.base.outputs.cluster_token
      cluster_ca_certificate = base64decode(
        component.base.outputs.cluster_ca_certificate
      )
    }
  }
}
provider "kubectl" "kubectl" {
  config {
    host  = component.base.outputs.cluster_endpoint
    token = component.base.outputs.cluster_token
    cluster_ca_certificate = base64decode(
      component.base.outputs.cluster_ca_certificate
    )
    load_config_file = false
  }
}

component "base" {
  source = "./base"
  providers = {
    random       = provider.random.rand
    digitalocean = provider.digitalocean.do
  }
}

component "content" {
  source = "./content"
  providers = {
    helm    = provider.helm.helm
    kubectl = provider.kubectl.kubectl
  }

  inputs = {
    OP_TOKEN  = var.OP_TOKEN
    OP_CREDENTIALS = var.OP_CREDENTIALS
    ARGOCD_USERNAME = var.ARGOCD_USERNAME
    ARGOCD_PASSWORD = var.ARGOCD_PASSWORD
  }
}
