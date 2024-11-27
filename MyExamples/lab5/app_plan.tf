resource "azurerm_service_plan" "lab5svcp" {
  name                = "lab5svcp"
  resource_group_name = azurerm_resource_group.lab5.name
  location            = azurerm_resource_group.lab5.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_function_app" "lab5function" {
  name                = "http-invoke"
  resource_group_name = azurerm_resource_group.lab5.name
  location            = azurerm_resource_group.lab5.location

  storage_account_name       = azurerm_storage_account.lab5sa.name
  storage_account_access_key = azurerm_storage_account.lab5sa.primary_access_key
  app_service_plan_id        = azurerm_service_plan.lab5svcp.id
  os_type                    = "linux"
  version                    = "~4"

#   site_config {
#     application_stack{
#       python_version = "3.9"
 
  site_config {
    linux_fx_version = "python|3.9"
  }
}

