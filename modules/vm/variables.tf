variable "resource_group_name" {}

variable "location" {}

variable "vm_name" {}

variable "vm_size" {}

variable "admin_username_pdc01" {}

variable "admin_username_pdc02" {
  default = " pdc02Admin"
  description = "Administrator username for the VM"
  type        = string
}

variable "admin_password" {}

variable "os_publisher" {}

variable "os_offer" {}

variable "os_sku" {}

variable "os_version" {}

variable "nic_id" {}

variable "Domain_DNSName1" {}

variable "Domain_DNSName2" {
  description = "FQDN for the Active Directory forest root domain"
  type        = string
  sensitive   = false
  default = "dom02.it"
}

variable "netbios_name" {
  description = "NETBIOS name for the AD domain"
  type        = string
  sensitive   = false
  default = "dom"
}

variable "SafeModeAdministratorPassword" {
  description = "Password for AD Safe Mode recovery"
  type        = string
  sensitive   = true
  default     = "StefanoAre140488_"
}