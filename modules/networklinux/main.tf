# Vnet is already created --> second_vnet_name

# Create subnet
resource "azurerm_subnet" "myterraformsubnet" {
  name                 = "mySubnetLinux"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.second_vnet_name
  address_prefixes     = ["20.20.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
  name                = "myPublicIPLinux"
  location            = var.second_vnet_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg" {
  name                = "myNetworkSecurityGroupLinux"
  location            = var.second_vnet_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22" 
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "myterraformnic" {
  name                = "myNICLinux"
  location            = var.second_vnet_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "myNicConfigurationLinux"
    subnet_id                     = azurerm_subnet.myterraformsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
  }
  
  depends_on = [azurerm_subnet.myterraformsubnet]
}  


# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.myterraformnic.id
  network_security_group_id = azurerm_network_security_group.myterraformnsg.id
}