terraform {

  required_version = ">=0.15"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.11.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "cf8889e0-fc0a-4554-9e34-eaf35a771786"
}