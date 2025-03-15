# do-cluster

This is a repository for managing infrastructure using Terraform and ArgoCD.

Repository Structure:

* `.circleci/` – CI/CD configuration for CircleCI.
* `argocd/` – ArgoCD manifests for managing applications in Kubernetes (ref: [argocd.iakimenko.link](https://argocd.iakimenko.link)).
* `argocd/cosmos/` – Deployment configuration for a Cosmos RPC node (ref: [cosmos.iakimenko.link/status](https://cosmos.iakimenko.link/status)).
* `argocd/grafana/` – Deployment configuration for Grafana (ref: [grafana.iakimenko.link](https://grafana.iakimenko.link)).
* `terraform/` – Terraform (terragrunt) configurations for infrastructure management.
