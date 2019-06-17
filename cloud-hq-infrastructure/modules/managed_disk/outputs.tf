# The outputs of the Managed Disks created from this module

output "mdisk_id" {
    value = "${azurerm_managed_disk.mdisk.*.id}"
}