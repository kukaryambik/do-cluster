terraform {
  source = "./"
}

include "root" {
  path = find_in_parent_folders()
}

dependency "base" {
  config_path = "../base"
}

inputs = {
  cluster_endpoint = dependency.base.outputs.cluster_endpoint
  cluster_token    = dependency.base.outputs.cluster_token
  cluster_ca_certificate = base64decode(
    dependency.base.outputs.cluster_ca_certificate
  )
}
