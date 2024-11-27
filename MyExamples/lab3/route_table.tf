
resource "azurerm_route_table" "rt3" {
  name                = "lab3a-route-table"
  location            = azurerm_resource_group.RG3.location
  resource_group_name = azurerm_resource_group.RG3.name

 route {
    name           = "routelocal"
    address_prefix = "10.1.0.0/16"
    next_hop_type  = "VnetLocal"
  }

  route {
    name           = "routeinternet"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "Internet"
  }

}

resource "azurerm_subnet_route_table_association" "lab3a-rta" {
  subnet_id      = azurerm_subnet.lab3a-subnet.id
  route_table_id = azurerm_route_table.rt3.id
}