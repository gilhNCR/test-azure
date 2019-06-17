# The outputs of the subnet created from this module

output "sn_id" {
    value = "${azurerm_subnet.sn.*.id}"
}

output "sn_name" {
    value = "${azurerm_subnet.sn.*.name}"
}
