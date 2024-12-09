#####################################################################
# create first virtual network and three subnets
#####################################################################
resource "azurerm_virtual_network" "firstvnet" {
  name          = var.first_vnet_name
  location      = var.first_vnet_location
  address_space = [var.first_vnet_AddressSpace]
  resource_group_name = var.resource_group_name
}

# subnet 1
resource "azurerm_subnet" "firstvnetsub1" {
  name = var.first_vnet_sub1_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.first_vnet_name
  address_prefixes = [ var.first_vnet_sub1_AddressSpace ]
  depends_on = [azurerm_virtual_network.firstvnet]
}

# subnet 2
resource "azurerm_subnet" "firstvnetsub2" {
  name = var.first_vnet_sub2_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.first_vnet_name
  address_prefixes = [ var.first_vnet_sub2_AddressSpace ]
  depends_on = [azurerm_virtual_network.firstvnet]
}

# subnet 3 clientw10
resource "azurerm_subnet" "firstvnetsub3" {
  name = var.first_vnet_sub3_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.first_vnet_name
  address_prefixes = [ var.first_vnet_sub3_AddressSpace ]
  depends_on = [azurerm_virtual_network.firstvnet]
}

#####################################################################
# create second virtual network and one subnet
#####################################################################
resource "azurerm_virtual_network" "secondvnet" {
  name  = var.second_vnet_name
  address_space = [var.second_vnet_AddressSpace]
  location = var.second_vnet_location
  resource_group_name=  var.resource_group_name
}
# subnet 1
resource "azurerm_subnet" "secondvnetsub1" {
  name = var.second_vnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.secondvnet.name
  address_prefixes = [ var.second_vnet_sub1_AddressSpace ]
}

