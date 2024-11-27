
resource "azurerm_virtual_network" "lab3a" {
  name                = "lab3-vNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.lab3a.location
  resource_group_name = azurerm_resource_group.lab3a.name
}

resource "azurerm_subnet" "lab3a" {
  name                 = "lab3a-subnet"
  resource_group_name  = azurerm_resource_group.lab3a.name
  virtual_network_name = azurerm_virtual_network.lab3a.name
  address_prefixes      = ["10.1.1.0/24"]
}
