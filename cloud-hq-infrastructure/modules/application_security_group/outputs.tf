# The outputs of the Application Security Groups created from this module

output "asg_id" {
    value = "${azurerm_application_security_group.asg.*.id}"
}