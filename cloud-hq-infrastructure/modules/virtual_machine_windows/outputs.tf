# The outputs of the virtual machine created from this module

output "vm_id" {
    value = "${azurerm_virtual_machine.vm.*.id}"
}