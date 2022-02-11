# Network Interface for jenkins 

# resource "azurerm_network_interface" "gamersquad-jenkins" {
#   name                = "gamersquad-jenkins-nic"
#   location            = azurerm_resource_group.gamersquad-ts.location
#   resource_group_name = azurerm_resource_group.gamersquad-ts.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.gamersquad-ts.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.gamersquad-jenkins.id
#   }
# }

# resource "azurerm_linux_virtual_machine" "gamersquad-jenkins" {
#   name                = "gamersquad-jenkins-machine"
#   resource_group_name = azurerm_resource_group.gamersquad-ts.name
#   location            = azurerm_resource_group.gamersquad-ts.location
#   size                = "Standard_B1s"
#   admin_username      = "azureuser"
#   network_interface_ids = [
#     azurerm_network_interface.gamersquad-jenkins.id,
#   ]

#   admin_ssh_key {
#     username   = "azureuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }
# }

# Network Interface for deployment instance

resource "azurerm_network_interface" "gamersquad-dev" {
  name                = "gamersquad-dev-nic"
  location            = azurerm_resource_group.gamersquad-ts.location
  resource_group_name = azurerm_resource_group.gamersquad-ts.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.gamersquad-ts.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.gamersquad-dev.id
  }
}

resource "azurerm_linux_virtual_machine" "gamersquad-dev" {
  name                = "gamersquad-dev-machine"
  resource_group_name = azurerm_resource_group.gamersquad-ts.name
  location            = azurerm_resource_group.gamersquad-ts.location
  size                = "Standard_B1ms"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.gamersquad-dev.id,
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}