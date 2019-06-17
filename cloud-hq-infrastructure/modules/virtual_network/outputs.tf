# The outputs of the virtual network created from this module

output "vn_id" {
    value = "${azurerm_virtual_network.vn.*.id}"
}

output "vn_name" {
    value = "${azurerm_virtual_network.vn.*.name}"
}

output "vn_resource_group_name" {
    value = "${azurerm_virtual_network.vn.*.resource_group_name}"
}

output "vn_location" {
    value = "${azurerm_virtual_network.vn.*.location}"
}

output "vn_address_space" {
    value = "${azurerm_virtual_network.vn.*.address_space}"
}

