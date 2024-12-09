# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = var.resource_group_name
  }

  byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "mystorageaccount" {
  name                     = "diag${random_id.randomId.hex}"
  location                 = var.second_vnet_location 
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "myterraformvm" {
  name                  = "myVMLinux"
  location              = var.second_vnet_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.nic_linux_id]
  size                  = var.vm_size_linux

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    offer = "0001-com-ubuntu-server-focal"
    publisher = "Canonical"
    sku = "20_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "myvmlinux"
  admin_username                  = var.vm_username_linux
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.vm_username_linux
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
        storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
  }
}