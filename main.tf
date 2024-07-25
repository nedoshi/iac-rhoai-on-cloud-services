

    variable "cluster_name" {}
    module "rosa" {
      source = "git::https://github.com/rh-mobb/terraform-rosa.git?ref=v0.0.5"
      region               = var.region
      private              = false
      multi_az             = var.multi_az
      cluster_name         = var.cluster_name
      ocp_version          = var.ocp_version
      token                = var.token
      admin_password       = var.admin_password
      developer_password   = ""
      pod_cidr             = "10.128.0.0/14"
      service_cidr         = "172.30.0.0/16"
      hosted_control_plane = true
      replicas             = 2
      max_replicas         = 4
      tags = {
        "cost-center"   = "CC468"
        "service-phase" = "lab"
        "app-code"      = "MOBB-001"
        "owner"         = "cwooley_redhat.com"
        "provisioner"   = "Terraform"
      }
    }

resource "aws_s3_bucket" "buckets" {
    for_each = toset(var.bucket_names)

    bucket = each.key

    tags = {
        Name        = each.key
        Environment = "Production"
    }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.example.id
  acl    = "private"  # or "public-read", etc.
}

resource "rhcs_machine_pool" "secondary_pool" {
  cluster      = module.hcp.cluster_id
  name         = var.secondary_machine_pool_name
  machine_type = var.secondary_machine_pool_instance_type
  replicas     = var.secondary_machine_pool_replicas

  labels = {
    role = "worker"
  }

  taints = [
    {
      key    = "dedicated"
      value  = "worker"
      effect = "NoSchedule"
    }
  ]
}

output "rosa" {
    value = module.rosa
}
