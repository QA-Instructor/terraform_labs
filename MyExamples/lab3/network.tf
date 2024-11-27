
resource "azurerm_virtual_network" "lab3a-vnet" {
  name                = "lab3-vNet"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.RG3.location
  resource_group_name = azurerm_resource_group.RG3.name
}

resource "azurerm_subnet" "lab3a-subnet" {
  name                 = "lab3a-subnet"
  resource_group_name  = azurerm_resource_group.RG3.name
  virtual_network_name = azurerm_virtual_network.lab3a-vnet.name
  address_prefixes      = ["10.1.1.0/24"]
}
