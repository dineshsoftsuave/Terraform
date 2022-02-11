# resource "azurerm_cosmosdb_account" "gamersquad-ts" {
#   name                      = "gamersquad-db"
#   location                  = azurerm_resource_group.gamersquad-ts.location
#   resource_group_name       = azurerm_resource_group.gamersquad-ts.name
#   offer_type                = "Standard"
#   kind                      = "MongoDB"
#   enable_automatic_failover = true

#   is_virtual_network_filter_enabled = true

#   virtual_network_rule {
#     id = azurerm_subnet.gamersquad-ts2.id
#   }

#   capabilities {
#     name = "EnableMongo"
#   }

#   capabilities {
#     name = "MongoDBv3.4"
#   }

  
#   consistency_policy {
#     consistency_level = "session"
#   }


#   geo_location {
#     location          = "East US"
#     failover_priority = 0
#   }

# }

