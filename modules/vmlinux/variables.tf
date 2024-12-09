variable "resource_group_name"{}
    
variable "resource_group_location" {}

variable "vm_username_linux" {}

variable "vm_size_linux" {}

variable "nic_linux_id" {
  description = "ID dell'interfaccia di rete"
  type        = string
}

variable second_vnet_location {}