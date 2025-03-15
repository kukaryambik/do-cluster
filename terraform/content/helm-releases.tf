provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    token                  = var.cluster_token
    cluster_ca_certificate = var.cluster_ca_certificate
  }
}

resource "helm_release" "argocd" {

  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.8.10"
  atomic     = true
  timeout    = 600

  namespace        = "argocd"
  create_namespace = true

  values = [
    "${file("argocd/values.yaml")}"
  ]

  dynamic "set_sensitive" {
    for_each = var.ARGOCD_USERNAME == null ? [] : [1]
    content {
      name  = "configs.repositories.argocd-cluster.username"
      value = var.ARGOCD_USERNAME
    }
  }

  dynamic "set_sensitive" {
    for_each = var.ARGOCD_PASSWORD == null ? [] : [1]
    content {
      name  = "configs.repositories.argocd-cluster.password"
      value = var.ARGOCD_PASSWORD
    }
  }
}
