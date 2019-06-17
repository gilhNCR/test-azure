### Compute resources for HQ  in the Azure Cloud


# Provider settings

provider "azurerm" {
    subscription_id = "${var.subscription_id}"
}

### Remote State Configuration ###

terraform {
    backend "azurerm" {}
}

### Data Sources ###

data "terraform_remote_state" "networking_state" {
  backend = "azurerm"

  config {
    storage_account_name = "${var.storage_account_name}"
    container_name       = "${var.container_name}"
    access_key           = "${var.access_key}"
    key                  = "networking/networking.tfstate"
  }
}

### Availability Sets ###

 module "rap_availability_set" {
     source               = "../../../modules/availability_set"
     aset_names           = "${var.rap_aset_names}"
     location             = "${var.location}"
     resource_group_name  = "${var.resource_group_name}"
     managed              = "${var.rap_aset_managed}"
     tags                 = "${var.tags}"
 }

### Virtual Machines ###

# RAP Server Virtual Machines

# Lewis, RAP servers need to be in an availability set or a scaling (lb error)

module "rap_server_vms" {
    source                = "../../../modules/virtual_machine_windows"
    vm_names              = "${var.rap_vm_names}"
    location              = "${var.location}"
    resource_group_name   = "${var.resource_group_name}"
    network_interface_ids = "${data.terraform_remote_state.networking_state.rap_nic_ids}"
    vm_size               = "${var.rap_vm_size}"
    availability_set_id   = "${module.rap_availability_set.aset_id[0]}"
    tags                  = "${var.tags}"

    publisher             = "${var.rap_publisher}"
    offer                 = "${var.rap_offer}"
    sku                   = "${var.rap_sku}"

    os_disk_name          = "${var.rap_os_disk_name}"
    create_option         = "${var.rap_create_option}"
    managed_disk_type     = "${var.rap_managed_disk_type}"

    computer_name         = "${var.rap_computer_name}"
    admin_username        = "${var.rap_admin_username}"
    admin_password        = "${var.rap_admin_password}"

    timezone              = "${var.rap_timezone}"
}
