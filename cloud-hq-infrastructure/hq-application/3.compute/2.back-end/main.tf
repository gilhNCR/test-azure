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

 module "rmq_availability_set" {
     source               = "../../../modules/availability_set"
     aset_names           = "${var.rmq_aset_names}"
     location             = "${var.location}"
     resource_group_name  = "${var.resource_group_name}"
     managed              = "${var.rmq_aset_managed}"
     tags                 = "${var.tags}"
 }

### Virtual Machines ###

# RMQ Server Virtual Machines

module "rmq_server_vms" {
    source                = "../../../modules/virtual_machine_windows"
    vm_names              = "${var.rmq_vm_names}"
    location              = "${var.location}"
    resource_group_name   = "${var.resource_group_name}"
    network_interface_ids = "${data.terraform_remote_state.networking_state.rmq_nic_ids}"
    vm_size               = "${var.rmq_vm_size}"
    availability_set_id   = "${module.rmq_availability_set.aset_id[0]}"
    tags                  = "${var.tags}"

    publisher             = "${var.rmq_publisher}"
    offer                 = "${var.rmq_offer}"
    sku                   = "${var.rmq_sku}"

    os_disk_name          = "${var.rmq_os_disk_name}"
    create_option         = "${var.rmq_create_option}"
    managed_disk_type     = "${var.rmq_managed_disk_type}"

    computer_name         = "${var.rmq_computer_name}"
    admin_username        = "${var.rmq_admin_username}"
    admin_password        = "${var.rmq_admin_password}"

    timezone              = "${var.rmq_timezone}"
}

# Tag variables

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}