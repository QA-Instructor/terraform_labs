output "sa_name" {
    description = "Name of the storage account"
    value = azurerm_storage_account.lab5sa.name
}

output "Function_App_Name" {
  description = "Name of the App."

  value = azurerm_function_app.lab5function.name
}

output "Function_Name" {
  description = "Name of the function."

  value = azurerm_function_app_function.lab5fafx.name
}