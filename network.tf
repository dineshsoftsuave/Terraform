resource "azurerm_virtual_network" "gamersquad-ts" {
  name                = "gamersquad-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.gamersquad-ts.location
  resource_group_name = azurerm_resource_group.gamersquad-ts.name
}

module "network-security-group" {
  source              = "Azure/network-security-group/azurerm"
  resource_group_name = azurerm_resource_group.gamersquad-ts.name
  location            = azurerm_resource_group.gamersquad-ts.location
  security_group_name = "nsg"

  custom_rules = [
    {
      name                   = "myssh"
      priority               = 201
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "22"
      description            = "description-myssh"
    },
    {
      name                   = "gamersquad-port"
      priority               = 200
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "8080"
      description            = "description-port"
    },
    {
      name                   = "cosmosdb"
      priority               = 202
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "27017"
      description            = "description-cosmosdb"
    },
  ]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.gamersquad-ts]
}

resource "azurerm_subnet" "gamersquad-ts" {
  name                 = "SubnetA"
  resource_group_name  = azurerm_resource_group.gamersquad-ts.name
  virtual_network_name = azurerm_virtual_network.gamersquad-ts.name
  address_prefixes     = ["10.0.1.0/24"]

}
resource "azurerm_subnet" "gamersquad-ts2" {
  name                 = "SubnetB"
  resource_group_name  = azurerm_resource_group.gamersquad-ts.name
  virtual_network_name = azurerm_virtual_network.gamersquad-ts.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.AzureCosmosDB"]
}

# resource "azurerm_public_ip" "gamersquad-jenkins" {
#   name                = "gamersquad-jenkins-machine-pip"
#   resource_group_name = azurerm_resource_group.gamersquad-ts.name
#   location            = azurerm_resource_group.gamersquad-ts.location
#   allocation_method   = "Static"
#   sku                 = "Basic"
# }
resource "azurerm_public_ip" "gamersquad-dev" {
  name                = "gamersquad-dev-machine-pip"
  resource_group_name = azurerm_resource_group.gamersquad-ts.name
  location            = azurerm_resource_group.gamersquad-ts.location
  allocation_method   = "Static"
  sku                 = "Basic"
}
