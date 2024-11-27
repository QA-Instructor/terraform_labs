resource "azurerm_network_interface" "lab3-nic" {
  name                = "lab3-nic"
  location            = azurerm_resource_group.RG3.location
  resource_group_name = azurerm_resource_group.RG3.name

  ip_configuration {
    name                          = "lab3_ip"
    subnet_id                     = azurerm_subnet.lab3a-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# for the windows vm you need to specify the VM including its os_disk and source_image_reference


resource "azurerm_windows_virtual_machine" "lab3a" {
  name                = "vm3"
  resource_group_name = azurerm_resource_group.RG3.name
  location            = azurerm_resource_group.RG3.location
  size                = "Standard_B2S"
  admin_username      = "TFadminuser"
  admin_password      = "TF_P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.lab3-nic.id,
  ]
 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_public_ip" "lab3publicpip" {
  name                    = "lab3-pip"
  location                = azurerm_resource_group.RG3.location
  resource_group_name     = azurerm_resource_group.RG3.name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30


}