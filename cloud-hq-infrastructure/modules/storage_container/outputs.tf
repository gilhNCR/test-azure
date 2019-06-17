# The id of the storage account created from this module

output "sc_id" {
    value = "${azurerm_storage_container.sc.id}"
}