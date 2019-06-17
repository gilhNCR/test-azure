# Virtual Machine

resource "azurerm_virtual_machine" "vm" {
    count                 = "${length(var.vm_names)}"
    name                  = "${var.vm_names[count.index]}"
    location              = "${var.location}"
    resource_group_name   = "${var.resource_group_name}"
    network_interface_ids = ["${var.network_interface_ids[count.index]}"]
    vm_size               = "${var.vm_size}"

    delete_os_disk_on_termination    = "true"
    delete_data_disks_on_termination = "true"
    availability_set_id              = "${var.availability_set_id}"

    storage_image_reference {
        publisher = "${var.publisher[count.index]}"
        offer     = "${var.offer[count.index]}"
        sku       = "${var.sku[count.index]}"
        version   = "latest"
    }
    storage_os_disk {
        name              = "${lower(var.tags["project"])}-${lower(var.tags["environment"])}-${var.os_disk_name[count.index]}"
        caching           = "ReadWrite"
        create_option     = "${var.create_option[count.index]}"
        managed_disk_type = "${var.managed_disk_type[count.index]}"

    }
    os_profile {
        computer_name  = "${var.computer_name[count.index]}"
        admin_username = "${var.admin_username[count.index]}"
        admin_password = "${var.admin_password[count.index]}"
    }
    os_profile_windows_config {
        timezone       = "${var.timezone}"
    }
    tags = {
        environment = "${var.tags["environment"]}"
        project     = "${var.tags["project"]}"
        live        = "${var.tags["live"]}"
        owner       = "${var.tags["owner"]}"
        costcentre  = "${var.tags["costcentre"]}"
        role        = "${var.tag_role[count.index]}"
    }

}
