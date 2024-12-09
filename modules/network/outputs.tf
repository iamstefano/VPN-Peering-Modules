output first_vnet_sub1_id{
  value = azurerm_subnet.firstvnetsub1.id
}

output first_vnet_sub2_id{
  value = azurerm_subnet.firstvnetsub2.id
}

output second_vnet_sub1_id {
value = azurerm_subnet.secondvnetsub1.id
}

output first_vnet_id {
value = azurerm_virtual_network.firstvnet.id
}

output second_vnet_id {
value = azurerm_virtual_network.secondvnet.id
}