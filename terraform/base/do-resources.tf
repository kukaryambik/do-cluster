resource "digitalocean_project" "default" {
  name        = "my-pet-project"
  description = "Pet project for self-education."
  purpose     = "Kubernetes Cluster"
  environment = "Production"
}

resource "random_pet" "do-k8s-cluster" {}

module "do-k8s-cluster" {
  source  = "kukaryambik/k8s-cluster/digitalocean"
  version = "v0.2.4"

  depends_on = [
    digitalocean_project.default,
    random_pet.do-k8s-cluster,
  ]

  project_name = digitalocean_project.default.name

  name                      = digitalocean_project.default.name
  region                    = "ams3"
  kubernetes_version_prefix = "1.32."
  auto_upgrade              = true
  surge_upgrade             = true

  node_pools = [{
    default    = true
    name       = "worker-pool"
    size       = "s-4vcpu-8gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
  }]

  maintenance_policy = {
    start_time = "03:00"
    day        = "monday"
  }
}

output "cluster_endpoint" {
  value = module.do-k8s-cluster.endpoint
}

output "cluster_token" {
  value     = module.do-k8s-cluster.kube_config.token
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = module.do-k8s-cluster.kube_config.cluster_ca_certificate
  sensitive = true
}
