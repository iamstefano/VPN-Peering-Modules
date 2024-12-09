resource "azurerm_windows_virtual_machine" "myterraformvm" {
  name                = var.vm_name_client
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = var.vm_size_client
  admin_username      = var.vm_username_client
  admin_password      = var.vm_password_client
  network_interface_ids = [var.nic_id_client]  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_storage_account_type_client
  }

  source_image_reference {
    publisher = var.image_publisher_client
    offer     = var.image_offer_client
    sku       = var.image_sku_client
    version   = var.image_version_client
  }
}