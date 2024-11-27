resource "azurerm_storage_container" "lab3b-cont" {
  name                  = "lab3b-cont"
  storage_account_name    = azurerm_storage_account.lab3bsa.name
  container_access_type = "blob"
}