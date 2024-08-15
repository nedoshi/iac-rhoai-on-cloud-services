#Cluster Vars

variable "cluster_name" {
  description = "The name of the cluster.  This is also used as a prefix to name related components."
  type        = string
  default     = "aro-rhoai"
}

variable "pull_secret_path" {
  type = string
  default = "~/Downloads/pull-secret.txt"
}

variable "subscription_id" {
  description = "The subscription ID run `az account show --query id --output tsv` to figure it out"
  type = string
}

variable "aro_version" {
  type = string
  default = "4.14.16"
}

variable "location" {
  type = string
  default = "southcentralus"
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

variable "resource_group_name" {
  type = string
  default = "aro-rhoai-rg"
}

variable "worker_node_count" {
  type = string
  default = 6
}