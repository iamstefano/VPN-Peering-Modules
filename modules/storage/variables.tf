variable "resource_group_name" {}

variable "location_storage" {}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "storage_account_tier" {}

variable "storage_account_replication_type" {}

variable "storage_account_kind" {}

variable "storage_container_name" {}