# The id of the resource group created from this module

output "rg_id" {
    value = "${azurerm_resource_group.rg.id}"
}

output "rg_name" {
    value = "${azurerm_resource_group.rg.name}"
}