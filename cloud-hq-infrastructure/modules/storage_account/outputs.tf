# The id of the storage account created from this module

output "sa_id" {
    value = "${azurerm_storage_account.sa.id}"
}

# The name of the storage account created from this module

output "sa_name" {
    value = "${azurerm_storage_account.sa.name}"
}