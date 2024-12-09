output nic_id {
  value = azurerm_network_interface.pdcnic.id
}

output "public_ip_address" {
  value = azurerm_public_ip.PdcPiptf.ip_address
}
