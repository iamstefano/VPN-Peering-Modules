output "public_ip_address" {
  value = azurerm_linux_virtual_machine.myterraformvm.public_ip_address
}

output "ssh_private_key" {
  value     = tls_private_key.example_ssh.private_key_pem
  sensitive = true
}

output "ssh_public_key" {
  value = tls_private_key.example_ssh.public_key_openssh
}