
resource "azurerm_virtual_network" "lab4-vnet" {
  name                = "lab4-vNet"
  address_space       = ["10.1.0.0/16"]
  location            = var.rg.location
  resource_group_name = var.rg.name
}

resource "azurerm_subnet" "lab4-public-subnet" {
  name                 = "lab4-public-subnet"
  resource_group_name  = var.rg.name
  virtual_network_name = azurerm_virtual_network.lab4-vnet.name
  address_prefixes      = ["10.1.0.0/24"]
}

resource "azurerm_subnet" "lab4-pprivate-subnet" {
  name                 = "lab4-private-subnet"
  resource_group_name  = var.rg.name
  virtual_network_name = azurerm_virtual_network.lab4-vnet.name
  address_prefixes      = ["10.1.1.0/24"]
}

