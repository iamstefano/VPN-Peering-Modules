resource "azurerm_storage_account" "example" {
    name                     = var.storage_account_name
    resource_group_name      = var.resource_group_name
    location                 = var.location_storage
    account_tier             = var.storage_account_tier
    account_replication_type = var.storage_account_replication_type
    account_kind             = var.storage_account_kind
}

resource "azurerm_storage_container" "example" {
    name                 = var.storage_container_name
    storage_account_name  = azurerm_storage_account.example.name
    container_access_type = "private"
}

resource "azurerm_storage_share" "example" {
  name                 = "allin-share"
  storage_account_name  = azurerm_storage_account.example.name
  quota                = 10 #GB
}