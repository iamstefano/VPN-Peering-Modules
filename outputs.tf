output "public_ip_address_pdc1" {
  value = module.pdc01.public_ip_address
}

output "public_ip_address_pdc2" {
  value = module.pdc02.public_ip_address
}

output "private_ip_address_pdc1" {
  value = module.pdc01.private_ip_address
}

output "private_ip_address_pdc2" {
  value = module.pdc02.private_ip_address
}

output "vm_linux_ip" {
  value = module.vmlinux.public_ip_address
}

output "ssh_private_key" {
  value     = module.vmlinux.ssh_private_key
  sensitive = true
}

/* output "ssh_public_key" {
  value = module.vmlinux.ssh_public_key
} */

