# do-cluster

This is a repository for managing infrastructure using Terraform and ArgoCD.

Repository Structure:

* [`.circleci/`](./.circleci) – CI/CD configuration for CircleCI.
* [`argocd/`](./argocd) – ArgoCD manifests for managing applications in Kubernetes (ref: [argocd.iakimenko.me](https://argocd.iakimenko.me)).
* [`argocd/cosmos/`](./argocd/cosmos) – Deployment configuration for a Cosmos RPC node (ref: [cosmos.iakimenko.me/status](https://cosmos.iakimenko.me/status)).
* [`argocd/grafana/`](./argocd/grafana) – Deployment configuration for Grafana (ref: [grafana.iakimenko.me](https://grafana.iakimenko.me)).
* [`terraform/`](./terraform) – Terraform (terragrunt) configurations for infrastructure management.
