# ArgoCD Cluster

## File Structure & Naming Convention

### File Structure

The file structure is based on the K8S cluster structure and grouped by namespace; e.g.: [`cluster/guestbook/app_helm-guestbook.yaml`](./cluster/guestbook/app_helm-guestbook.yaml) for the `helm-guestbook` ArgoCD Application in the `guestbook` namespace.
The namespace level entities are located in the directories of these namespaces.
The cluster level entities are located in the `_cluster` directory.

You can also create a `_pre` and `_post` subdirectories in namespace folders to split resources by [ArgoCD Sync Waves](https://argo-cd.readthedocs.io/en/stable/user-guide/sync-waves/).

**By default ArgoCD will prune resources if they are not tracked by Git anymore.**

### File Naming

File names should be constructed as follows: `<resourcetype>_<full-resource-name>.yaml`.
Only standard abbreviations and short resource names are allowed.
Example: `secret_gitlab-registry-creds.yaml` for Secret or `cm_my-app-envs.yaml` for ConfigMap.

### Exceptions

The only exception is namespace files. It is a cluster scoped resources, but is located inside a namespace directory and named `_ns.yaml`.
