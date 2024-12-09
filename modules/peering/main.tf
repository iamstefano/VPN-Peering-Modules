#effettua il peering tra VNet01 e VNet02

# Peering VNet01 to VNet02
resource "azurerm_virtual_network_peering" "vnet01-vnet02-peer" {
    name                      = "vnet01tovnet02"
    resource_group_name       = var.resource_group_name
    virtual_network_name      = var.vnet01_name
    remote_virtual_network_id = var.peering_vnet2_id

    allow_virtual_network_access = true
    allow_forwarded_traffic = true
    allow_gateway_transit   = true
    use_remote_gateways     = false
}

# Peering VNet02 to VNet01
resource "azurerm_virtual_network_peering" "vnet02-vnet01-peer" {
    name                      = "vnet02tovnet01"
    resource_group_name       = var.resource_group_name
    virtual_network_name      = var.vnet02_name
    remote_virtual_network_id = var.peering_vnet1_id
    allow_virtual_network_access = true
    allow_forwarded_traffic = true
    allow_gateway_transit   = false
    use_remote_gateways     = true
}