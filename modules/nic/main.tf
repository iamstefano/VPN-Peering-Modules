# Create public IPs
resource "azurerm_public_ip" "PdcPiptf" {
    name                         = var.pip_name1
    location                     = var.vnet_location
    resource_group_name          = var.resource_group_name
    allocation_method            = "Dynamic"

}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "pdcnsgtf" {
    name                = var.nsg_name1
    location            = var.vnet_location
    resource_group_name = var.resource_group_name

    security_rule {
        name                       = "AllowRDP"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

}
# Create Pdc01-02 NIC
resource "azurerm_network_interface" "pdcnic" {
  name                = var.nic_name1
  location            = var.vnet_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.PdcPiptf.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "hoihoi" {
  network_interface_id      = azurerm_network_interface.pdcnic.id
  network_security_group_id = azurerm_network_security_group.pdcnsgtf.id
}

