terraform {
  source = "./"
}

include "root" {
  path = find_in_parent_folders()
}

dependency "base" {
  config_path  = "../base"
  mock_outputs = {
    cluster_endpoint       = "my-cluster-endpoint"
    cluster_token          = "my-cluster-token"
    cluster_ca_certificate = base64encode("my-ca-cert")
  }
}

inputs = {
  cluster_endpoint = dependency.base.outputs.cluster_endpoint
  cluster_token    = dependency.base.outputs.cluster_token
  cluster_ca_certificate = base64decode(
    dependency.base.outputs.cluster_ca_certificate
  )
}
