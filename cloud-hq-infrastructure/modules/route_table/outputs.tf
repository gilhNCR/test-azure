# The outputs of the route table created from this module

output "rt_name" {
    value = "${azurerm_route_table.rt.*.name}"
}

output "rt_id" {
    value = "${azurerm_route_table.rt.*.id}"
}