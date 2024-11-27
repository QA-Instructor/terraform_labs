resource "azurerm_network_security_group" "lab3a-sg" {
  name                = "lab3a-sg"
  location            = azurerm_resource_group.RG3.location
  resource_group_name = azurerm_resource_group.RG3.name

  security_rule {
    name                       = "lab3a-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    // destination_port_range     = "*"
    destination_port_ranges     = [3389]
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }


}

resource "azurerm_subnet_network_security_group_association" "lab3a-sga" {
  subnet_id                 = azurerm_subnet.lab3a-subnet.id
  network_security_group_id = azurerm_network_security_group.lab3a-sg.id
}