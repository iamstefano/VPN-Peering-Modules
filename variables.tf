variable "resource_group_name" {
  default       = "sa-vpnpeeringM2-rg"
  description   = "Resource group name."
}

variable "resource_group_location" {
  /* default       = "italynorth" */
  default       = "westus"
  description   = "Location of the resource group."
}

#network

# First Virtual Network
variable "first_vnet_name" {
  default = "VNet01"
  description ="Name of first Virtual network"
}

variable "first_vnet_AddressSpace" {
  default = "10.10.0.0/16"
  description = "Addres space of first virtual network"
}

variable "first_vnet_location"{
  default = "westus"
}
# First Virtual Network Subnets
variable "first_vnet_sub1_name" {
  default = "Pdc01Sub"
  description ="Name of the first subnet into first Virtual network"
}

variable "first_vnet_sub1_AddressSpace" {
  default = "10.10.0.0/24"
  description = "Addres space of first subnet into first virtual network"
}

variable "first_vnet_sub3_name" {
  default = "ClientW10sub"
  description ="Name of the third subnet for ClientW10 into first Virtual network"
}

variable "first_vnet_sub3_AddressSpace" {
  default = "10.10.1.0/24"
  description = "Addres space of first subnet into first virtual network"
}
# Second Virtual Network Subnets for VPN Gateway
variable "first_vnet_sub2_name" {
  default = "GatewaySubnet"
  description ="Name of the VPN Gateway subnet into first Virtual network"
}

variable "first_vnet_sub2_AddressSpace" {
  default = "10.10.255.0/27"
  description = "Address space for Gateway VPN subnet into first virtual network"
}

# Second Virtual Network
variable "second_vnet_name" {
  default = "VNet02"
  description ="Name of second Virtual network"
}

variable "second_vnet_AddressSpace" {
  default = "20.20.0.0/16"
  description = "Address space of second virtual network"
}

variable "second_vnet_location"{
  default = "northeurope"
  description=  "location for second virtual network"
}

variable "second_vnet_sub1_AddressSpace" {
  default = "20.20.0.0/24"
  description = "Address space for 1 subnet into second virtual network"
}

/*NETWORKlinux*/
variable "vnet_name_linux" {
  default = "saVnetLinux"
  description = "Nome Vnet"
}

variable "subnet_name_linux" {
  default = "saSubnetLinux"
  description = "Nome subnet"
}

//VM PDC01-02 
variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2ms"
}

/* variable "admin_username" {
  default = " pdc01Admin"
  description = "Administrator username for the VM"
  type        = string
} */

variable "admin_username_pdc01" {
  default = " pdc01Admin"
  description = "Administrator username for the VM"
  type        = string
}

variable "admin_username_pdc02" {
  default = " pdc02Admin"
  description = "Administrator username for the VM"
  type        = string
}

variable "admin_password" {
  default = "StefanoAre140488_"
  description = "Administrator password for the VM"
  type        = string
  sensitive   = true
}

variable "os_publisher" {
  description = "Publisher of the OS image"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "os_offer" {
  description = "Offer of the OS image"
  type        = string
  default     = "WindowsServer"
}

variable "os_sku" {
  description = "SKU of the OS image"
  type        = string
  default     = "2022-Datacenter"
}

variable "os_version" {
  description = "Version of the OS image"
  type        = string
  default     = "latest"
}

variable "Domain_DNSName1" {
  description = "FQDN for the Active Directory forest root domain"
  type        = string
  sensitive   = false
  default = "dom01.it"
}

variable "Domain_DNSName2" {
  description = "FQDN for the Active Directory forest root domain"
  type        = string
  sensitive   = false
  default = "dom02.it"
}

//Nic 1-2-3client

variable "nic_name1" {
  description = "Name of the nic"
  type        = string
  default     = "vm-nic1"
}

variable "pip_name1" {
  description = "Name of the pip"
  type        = string
  default     = "vm-pip1"
}

variable "nsg_name1" {
  description = "Name of the nsg"
  type        = string
  default     = "vm-nsg1"
}

variable "nic_name2" {
  description = "Name of the nic"
  type        = string
   default     = "vm-nic2"
}

variable "pip_name2" {
  description = "Name of the nic"
  type        = string
  default     = "vm-pip2"
}

variable "nsg_name2" {
  description = "Name of the nsg"
  type        = string
  default     = "vm-nsg2"
}

variable "nic_name3" {
  description = "Name of the nic"
  type        = string
   default     = "vm-nic3"
}

variable "pip_name3" {
  description = "Name of the nic"
  type        = string
  default     = "vm-pip3"
}

variable "nsg_name3" {
  description = "Name of the nsg"
  type        = string
  default     = "vm-nsg3"
}

variable "vm_name_pdc1" {
  default = "Pdc01"
}

variable "vm_name_pdc2" {
  default = "Pdc02"
}

//VM Linux
variable "vm_name_linux" {
  default = "dkServer"
  description = "Nome VM"
}

variable "vm_size_linux" {
  default = "Standard_B2ms"
  description = "Modello size della VM"
}

variable "vm_username_linux" {
  default = "dkadmin"
  description = "Username VM Linux"
}

//VM Windows 10 Client

variable "vm_name_client" {
  default = "ClientW10"
  description = "Nome VM"
}

variable "vm_size_client" {
  default = "Standard_B2ms"
  description = "Modello size della VM"
}

variable "vm_username_client" {
  default     = "clientw10"
  description = "Username VM"
  type        = string
}

variable "vm_password_client" {
  default     = "StefanoAre140488_"
  description = "Password VM"
  type        = string
  sensitive   = true
}

variable "os_disk_storage_account_type_client" {
  default = "Standard_LRS"
  description = "Tipo storage disk VM"
}

variable "image_publisher_client" {
  default = "microsoftwindowsdesktop"
  description = "Publisher immagine"
}

variable "image_offer_client" {
  default = "windows-10"
  description = "Tipo di immagine"
}

variable "image_sku_client" {
  default = "win10-22h2-pro"
  description = "Sku immagine"
}

variable "image_version_client" {
  default = "latest"
  description = "Versione immagine"
}

//Storage

variable "storage_account_name" {
  default = "sastorageacc777x"
  description = "Nome storage account"
}

variable "storage_account_tier" {
  default = "Standard"
  description = "Tier della storage account"
}

variable "storage_account_replication_type" {
  default = "LRS"
  description = "Replication type della storage account"
}

variable "location_storage"{
  default = "westus"
  description = "Location storage"
}

variable "storage_account_kind" {
  default = "StorageV2"
  description = "Kind storage account"  
}

variable "storage_container_name" {
  default = "sacontent"
  description = "Name storage container"    
}