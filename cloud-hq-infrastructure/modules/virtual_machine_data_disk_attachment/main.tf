# Virtual Machine Data Disk Attachment

resource "azurerm_virtual_machine_data_disk_attachment" "vmdd" {
  count              = "${length(var.mdisk_id)}"
  managed_disk_id    = "${var.mdisk_id[count.index]}"
  virtual_machine_id = "${var.vm_id}"
  lun                = "${var.lun[count.index]}"
  caching            = "ReadWrite"
}