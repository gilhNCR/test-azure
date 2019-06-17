# The outputs of the Load Balancer created from this module

output "lb_id" {
    value = "${azurerm_lb.lb.*.id}"
}