#Cluster Vars

variable "admin_password" {
    type      = string
    sensitive = true
}

variable "autoscaling" {
  description = <<EOF
  Enable autoscaling for the default machine pool, this is ignored for HCP clusters as autoscaling is not supported
  for Hosted Control Plane clusters at this time.

  WARN: this variable is deprecated.  Simply setting 'max_replicas' will enable autoscaling.  This will be removed
  in a future version of this module.
  EOF
  type        = bool
  nullable    = true
  default     = null
}

variable "bucket_names" {
  description = "List of S3 bucket names to create."
  type        = list(string)
  default     = ["bucket1", "bucket2"]
}

variable "cluster_name" {
  description = "The name of the cluster.  This is also used as a prefix to name related components."
  type        = string
  default     = "cwooley-test"
}

variable "compute_machine_type" {
  type = string
  default = "m5.xlarge"
}

variable "developer_password" {
  description = <<EOF
  Password for the 'developer' user. IDP is not created if unspecified.  Password must be 14 characters or more, contain
  one uppercase letter and a symbol or number.
  EOF
  type        = string
  sensitive   = true
  default     = ""
}

variable "hcp" {
  type        = any
  default     = "true"
}

variable "hosted_control_plane" {
  description = "Provision a ROSA cluster using a Hosted Control Plane."
  type        = bool
  default     = false
}

variable "multi_az" {
  description = <<EOF
  Configure the cluster to use a highly available, multi availability zone configuration.  It should be noted that use
  of the 'multi_az' variable may affect minimum requirements for 'replicas' and may restrict regions that do not have
  three availability zones.
  EOF
  type        = bool
  default     = false
}

variable "ocp_version" {
  type = string
  nullable = true
  default = null
}

variable "pod_cidr" {
  type = string
  default = "10.128.0.0/14"
}

variable "private" {
  type = bool
  default = false
}

variable "region" {
  description = "The AWS region to provision a ROSA cluster and required components into."
  type        = string
  default     = "us-east-1"
}

variable "secondary_machine_pool_instance_type" {
  type = string
  default = "p3.2xlarge"
}

variable "secondary_machine_pool_name" {
  type = string
  default = "workbench-mp"
}

variable "secondary_machine_pool_replicas" {
  description = "Number of replicas for the secondary machine pool."
  type        = number
  default     = 2
}

variable "service_cidr" {
  type = string
  default = "172.30.0.0/16"
}

variable "tags" {
  description = "Tags applied to all objects."
  type        = map(string)
  default     = {
    "cost-center"   = "CC468"
    "service-phase" = "lab"
    "app-code"      = "MOBB-001"
    "owner"         = "cwooley_redhat.com"
    "provisioner"   = "Terraform"
  }
}

variable "token" {
    type      = string
    sensitive = true
}

variable "vpc_cidr" {
  type = string
  default = "10.10.0.0/16"
}

variable "workers_replicas" {
  description = "Number of replicas for the worker machine pool."
  type        = number
  default     = 2
}

variable "workers_replicas_max" {
  description = "Number of replicas for the max worker machine pool."
  type        = number
  default     = 2
}