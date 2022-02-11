terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "720e59da-4165-46bf-bb6d-9b57a4998205"
  features {}
}

resource "azurerm_resource_group" "gamersquad-ts" {
  name     = "gamersquad_test"
  location = "east us"
}
terraform {
  backend "azurerm" {
    resource_group_name  = "gamersquad_storage"
    storage_account_name = "gamersquad"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    access_key           = "8Xu2nzmf+Ejwn4jmPcdxidCAqBWEFlMr14vwM7SbiQbbe5jk/Mc9lF1+vBwNGPs9C0zXeJYZ3ZGfLXo7xFPQQw=="
  }
}