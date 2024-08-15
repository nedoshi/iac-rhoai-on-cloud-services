
locals {
}

module "aro" {
  source = "git::https://github.com/rh-mobb/terraform-aro.git"
  pull_secret_path = var.pull_secret_path
  subscription_id = var.subscription_id
  cluster_name = var.cluster_name
  aro_version = var.aro_version
  location = var.location
  tags = var.tags
  worker_node_count = var.worker_node_count
}

# resource "aws_s3_bucket" "multiple_buckets" {
#   for_each = toset(var.bucket_names)
#   bucket = each.value
# }


# resource "aws_s3_bucket_public_access_block" "bucket1_private" {
#   for_each = aws_s3_bucket.multiple_buckets
#   bucket = each.value.bucket

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# resource "rhcs_hcp_machine_pool" "secondary_machine_pool" {
#     auto_repair = false
#     autoscaling = {
#       enabled = false
#     }
#     replicas = 2
#     aws_node_pool = {
#       instance_type = var.secondary_machine_pool_instance_type
#       tags          = var.tags
#     }
#     cluster   = module.rosa.cluster_id
#     name      = var.secondary_machine_pool_name
#     subnet_id = element(module.rosa.private_subnet_ids, 0)

# }
