terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.18.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RG4" {
  name     = "RG4"
  location = "West Europe"
}

module "network" {
    source = "./network"

    rg = azurerm_resource_group.RG4

}