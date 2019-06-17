# Managed Disk

resource "azurerm_managed_disk" "mdisk" {
    count                = "${length(var.mdisk_names)}"
    name                 = "${lower(var.tags["project"])}-${lower(var.tags["environment"])}-${var.mdisk_names[count.index]}"
    location             = "${var.location}"
    resource_group_name  = "${var.resource_group_name}"
    storage_account_type = "${var.storage_account_type[count.index]}"
    create_option        = "${var.create_option[count.index]}"
    disk_size_gb         = "${var.disk_size_gb[count.index]}"


    tags   = {
        environment = "${var.tags["environment"]}"
        project     = "${var.tags["project"]}"
        live        = "${var.tags["live"]}"
        owner       = "${var.tags["owner"]}"
        costcentre  = "${var.tags["costcentre"]}"
    }
}