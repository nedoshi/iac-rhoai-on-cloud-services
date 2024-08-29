
locals {
}

module "aro" {
  source = "git::https://github.com/rh-mobb/terraform-aro.git?ref=v0.1.0"
  pull_secret_path = var.pull_secret_path
  subscription_id = var.subscription_id
  cluster_name = var.cluster_name
  aro_version = var.aro_version
  location = var.location
  tags = var.tags
  worker_node_count = var.worker_node_count
}
