# Create Public IP for VPN Gateway 
resource "azurerm_public_ip" "vpnPiptf" {
    name                         = "vpnpip"
    location                     = var.location
    resource_group_name          = var.resource_group_name
    allocation_method            = "Static"
    sku                          = "Standard"

}

# Crete VPN Gateway
resource "azurerm_virtual_network_gateway" "vpngateway" {
  name                = "VNet1GWvpn"
  location            = var.location
  resource_group_name = var.resource_group_name
  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw2"
  generation    = "Generation2"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpnPiptf.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
  }

  vpn_client_configuration {
    address_space = ["172.16.101.0/24"]

    root_certificate {
      name = "RootCert"

      public_cert_data = <<EOF
MIIC5zCCAc+gAwIBAgIQHMOM37LPJJlOF3hgOL3TfTANBgkqhkiG9w0BAQsFADAW
MRQwEgYDVQQDDAtQMlNSb290Q2VydDAeFw0yNDExMjEwODIyMDJaFw0yNjExMjEw
ODMyMDJaMBYxFDASBgNVBAMMC1AyU1Jvb3RDZXJ0MIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEAzVNpplfKu+csgCS+PPWHZCYKDlvuBJWirZGVVn6VO0Gw
S+9cvInHKxuvb3FFJu3ml6yUi1DtQ/sUPjkb6/UMNgQU5GcZfxCV+JHdK/e+LtdT
WZH99URf2ULwSilOgfYLjOI3E4uxmVv0cQOF7m+mIvaz2czJhcEgCQNXYD/X2zEU
capRnYNtlsXmIh4p5pvmrbi742pBNtiOWEGJCPDKmdwSXABlneyuQybnFbMOUU01
ftbSRtMJHBWBhUT8GLDrjMv0yv8uF2yw+IV2YaAMVse+jgfcwuXpgVV/y7TN/qjs
ch00gzCm6hJqY/f0nULy8R966K94D5UrelsCTaA44QIDAQABozEwLzAOBgNVHQ8B
Af8EBAMCAgQwHQYDVR0OBBYEFLxCKdpJYoKrepCTUDFUGMAW1mHPMA0GCSqGSIb3
DQEBCwUAA4IBAQAa4oKe2rHxrW+MHf2vMcMVtzo1Pj+fffh/Oz2xfIMU2ZVQ3M7G
JvdqjCkKIlqQ6ab0yvMmyn3iT/75UFhFZM4MqS98Fj7YF4Sedcq6PxRDdqwMlvVK
CNgRIL74dF4wxnHK0Lv55fTB3F7mtj6WtOLG0/uxFwLDJRQGA5rSLctVLcX1NZby
iAwH9Yp7Gy6SGMzI+ZAefFiTQZgAuMLZA+AA4qSfkYXufO22Dxy0wbxmr/RzNHrB
1bjFS3FvUjmbGlCvuQJT0euFqxv7PzNBwy1XkqdG/c0TIVW4YvZfYG0d95tB1pBX
KsvHYHh7KXmjwxzsaVSaTnwTU8/nyGb7ildC
EOF
    }
  }
}