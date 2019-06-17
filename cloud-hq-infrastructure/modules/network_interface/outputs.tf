# The outputs of the Network Interfaces created from this module

output "nic_id" {
    value = "${azurerm_network_interface.nic.*.id}"
}