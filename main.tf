terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.100.0"
    }
  }
}

provider "azurerm" {
 features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
  subscription_id= "3fbf8c25-42c1-4347-b310-6642844443e8"

}

#Resource group
resource "azurerm_resource_group" "rg" {
  name      = var.resource_group_name
  location  = var.resource_group_location
}


module "network" {
  source = "./modules/network"
  resource_group_name = azurerm_resource_group.rg.name          
  first_vnet_name = var.first_vnet_name
  first_vnet_AddressSpace= var.first_vnet_AddressSpace
  first_vnet_location =var.first_vnet_location
  first_vnet_sub1_name =var.first_vnet_sub1_name
  first_vnet_sub1_AddressSpace=var.first_vnet_sub1_AddressSpace
  first_vnet_sub2_name =var.first_vnet_sub2_name
  first_vnet_sub2_AddressSpace = var.first_vnet_sub2_AddressSpace
  first_vnet_sub3_name =var.first_vnet_sub3_name
  first_vnet_sub3_AddressSpace = var.first_vnet_sub3_AddressSpace
  second_vnet_name = var.second_vnet_name
  second_vnet_AddressSpace = var.second_vnet_AddressSpace
  second_vnet_location = var.second_vnet_location
  second_vnet_sub1_AddressSpace = var.second_vnet_sub1_AddressSpace
  depends_on = [azurerm_resource_group.rg] 
}

module "networklinux" {
  source = "./modules/networklinux"
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
  second_vnet_name = var.second_vnet_name
  second_vnet_location = var.second_vnet_location
  depends_on = [azurerm_resource_group.rg, module.network]
}

module "nic01" {
  source = "./modules/nic"
  resource_group_name = var.resource_group_name
  nic_name1 = var.nic_name1
  pip_name1 = var.pip_name1
  nsg_name1 = var.nsg_name1
  subnet_id = module.network.first_vnet_sub1_id
  vnet_location = var.first_vnet_location
  depends_on = [module.network]
}

module "nic02"{
  source = "./modules/nic"
  resource_group_name = var.resource_group_name
  nic_name1 = var.nic_name2
  pip_name1 = var.pip_name2
  nsg_name1 = var.nsg_name2
  subnet_id = module.network.second_vnet_sub1_id
  vnet_location = var.second_vnet_location
  depends_on = [module.network]
}

module "nic03client"{
  source = "./modules/nic"
  resource_group_name = var.resource_group_name
  nic_name1 = var.nic_name3
  pip_name1 = var.pip_name3
  nsg_name1 = var.nsg_name3
  subnet_id = module.network.first_vnet_sub3_id
  vnet_location = var.first_vnet_location
  depends_on = [module.network]
}

module "pdc01" {
  source = "./modules/vm"
  resource_group_name = var.resource_group_name
  vm_name = var.vm_name_pdc1
  os_sku = var.os_sku
  os_offer = var.os_offer
  os_publisher = var.os_publisher
  os_version = var.os_version
  admin_username_pdc01 = var.admin_username_pdc01
  admin_password = var.admin_password
  vm_size = var.vm_size
  location = var.first_vnet_location
  nic_id = module.nic01.nic_id
  Domain_DNSName1 = var.Domain_DNSName1
  depends_on = [ module.nic01]
}

module "pdc02" {
  source = "./modules/vm"
  resource_group_name = var.resource_group_name
  vm_name = var.vm_name_pdc2
  os_sku = var.os_sku
  os_offer = var.os_offer
  os_publisher = var.os_publisher
  os_version = var.os_version
  admin_username_pdc01 = var.admin_username_pdc02
  admin_password = var.admin_password
  vm_size = var.vm_size
  location = var.second_vnet_location
  nic_id = module.nic02.nic_id
  Domain_DNSName1 = var.Domain_DNSName2
  depends_on = [module.nic02]
}


module "vmclientwin" {
  source = "./modules/vmclientwin"
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
  vm_name_client = var.vm_name_client
  image_offer_client = var.image_offer_client
  image_publisher_client = var.image_publisher_client
  image_sku_client = var.image_sku_client
  image_version_client = var.image_version_client
  os_disk_storage_account_type_client = var.os_disk_storage_account_type_client
  vm_size_client = var.vm_size_client
  vm_username_client = var.vm_username_client
  vm_password_client = var.vm_password_client
  nic_id_client = module.nic03client.nic_id
  depends_on = [module.nic03client]
}

module "vmlinux" {
  source = "./modules/vmlinux"
  resource_group_name = var.resource_group_name          
  resource_group_location = var.resource_group_location  
  vm_username_linux = var.vm_name_linux
  vm_size_linux = var.vm_size_linux
  nic_linux_id = module.networklinux.nic_linux_id
  second_vnet_location = var.second_vnet_location
  depends_on = [module.network, module.networklinux] 
}

module "vpn" {
  source = "./modules/vpn"
  resource_group_name = var.resource_group_name
  location = var.resource_group_location
  subnet_id = module.network.first_vnet_sub2_id
  depends_on = [module.network]
}

module "peering"{
  source = "./modules/peering"
  resource_group_name = var.resource_group_name
  vnet01_name = var.first_vnet_name
  vnet02_name = var.second_vnet_name
  peering_vnet1_id = module.network.first_vnet_id
  peering_vnet2_id = module.network.second_vnet_id
  depends_on = [module.network, module.vpn]
}

module "storage" {
  source = "./modules/storage"
  resource_group_name = var.resource_group_name
  location_storage = var.resource_group_location
  storage_account_name = var.storage_account_name
  storage_account_kind = var.storage_account_kind
  storage_account_replication_type = var.storage_account_replication_type
  storage_account_tier = var.storage_account_tier
  storage_container_name = var.storage_account_name
  depends_on = [module.network]
}

