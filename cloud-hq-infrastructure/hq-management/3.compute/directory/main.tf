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


### Availabbility Sets ###

module "ads_availability_set" {
    source               = "../../../modules/availability_set"
    aset_names           = "${var.ads_aset_names}"
    location             = "${var.location}"
    resource_group_name  = "${var.resource_group_name}"
    managed              = "${var.ads_aset_managed}"
    tags                 = "${var.tags}"
}

### Virtual Machines ###

# SQL Server Virtual Machines


module "ads_server_vms" {
    source                = "../../../modules/virtual_machine_windows"
    vm_names              = "${var.ads_vm_names}"
    location              = "${var.location}"
    resource_group_name   = "${var.resource_group_name}"
    network_interface_ids = "${data.terraform_remote_state.networking_state.ads_nic_ids}"
    vm_size               = "${var.ads_vm_size}"
    availability_set_id   = "${module.ads_availability_set.aset_id[0]}"
    tags                  = "${var.tags}"

    publisher             = "${var.ads_publisher}"
    offer                 = "${var.ads_offer}"
    sku                   = "${var.ads_sku}"

    os_disk_name          = "${var.ads_os_disk_name}"
    create_option         = "${var.ads_create_option}"
    managed_disk_type     = "${var.ads_managed_disk_type}"

    computer_name         = "${var.ads_computer_name}"
    admin_username        = "${var.ads_admin_username}"
    admin_password        = "${var.ads_admin_password}"

    timezone              = "${var.ads_timezone}"
}
