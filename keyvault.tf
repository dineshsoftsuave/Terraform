# data "azurerm_client_config" "current" {}
# resource "azurerm_key_vault" "gamersquad-ts" {
#   name                       = "gamersquad-test"
#   location                   = azurerm_resource_group.gamersquad-ts.location
#   resource_group_name        = azurerm_resource_group.gamersquad-ts.name
#   tenant_id                  = data.azurerm_client_config.current.tenant_id
#   sku_name                   = "standard"
#   soft_delete_retention_days = 7
#   purge_protection_enabled   = false

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = [
#       "create",
#       "get",
#       "list"
#     ]

#     certificate_permissions =[
#         "backup",
#         "create",
#         "delete",
#         "deleteIssuers",
#         "get",
#         "getIssuers",
#         "import",
#         "list",
#         "listIssuers",
#         "manageContacts",
#         "manageIssuers",
#         "purge",
#         "recover",
#         "restore",
#         "setIssuers",
#         "update",
#     ]

#     secret_permissions = [
#       "set",
#       "get",
#       "delete",
#       "purge",
#       "list",
#       "recover",
#       "restore",

#     ]
#   }
# }
# resource "azurerm_key_vault_secret" "gamersquad-key" {
#   name         = "gamersquad-db-uri"
#   value        = tostring("${azurerm_cosmosdb_account.gamersquad-ts.connection_strings[0]}")
#   key_vault_id = azurerm_key_vault.gamersquad-ts.id
# }