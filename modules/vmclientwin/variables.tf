variable "resource_group_name"{}

variable "resource_group_location" {}

variable "vm_name_client" {}

variable "vm_size_client" {}

variable "vm_username_client" {}

variable "vm_password_client" {}

variable "os_disk_storage_account_type_client" {}

variable "image_publisher_client" {}

variable "image_offer_client" {}

variable "image_sku_client" {}

variable "image_version_client" {}

variable "nic_id_client" {
  description = "ID dell'interfaccia di rete"
  type        = string
}