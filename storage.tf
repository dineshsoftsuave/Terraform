resource "azurerm_storage_account" "gamersquad-ts" {
  name                = "gamersquadimg"
  resource_group_name = azurerm_resource_group.gamersquad-ts.name

  location                 = azurerm_resource_group.gamersquad-ts.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}