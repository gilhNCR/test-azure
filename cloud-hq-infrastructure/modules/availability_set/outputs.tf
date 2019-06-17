# The outputs of the Availability set created from this module

output "aset_id" {
    value = "${azurerm_availability_set.a_set.*.id}"
}