output "private_ip_address" {
    value = azurerm_windows_virtual_machine.pdc01vmtf.private_ip_address
}

output "public_ip_address" {
    value = azurerm_windows_virtual_machine.pdc01vmtf.public_ip_address
}