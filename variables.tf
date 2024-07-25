#Cluster Vars
variable "token" {
    type      = string
    sensitive = true
}
variable "admin_password" {
    type      = string
    sensitive = true
}

variable "tags" {
  description = "Tags applied to all objects."
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "The AWS region to provision a ROSA cluster and required components into."
  type        = string
  default     = "us-east-1"
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

variable "hosted_control_plane" {
  description = "Provision a ROSA cluster using a Hosted Control Plane."
  type        = bool
  default     = false
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

# S3 vars
variable "bucket_names" {
  description = "List of S3 bucket names to create."
  type        = list(string)
  default     = ["bucket1", "bucket2"]
}

# Secondary Machine Pool vars
variable "secondary_machine_pool_name" {
  description = "Name of the secondary machine pool."
  type        = string
  default     = "secondary-pool"
}

variable "secondary_machine_pool_instance_type" {
  description = "Instance type for the secondary machine pool."
  type        = string
  default     = "m5.large"
}

variable "secondary_machine_pool_replicas" {
  description = "Number of replicas for the secondary machine pool."
  type        = number
  default     = 2
}

