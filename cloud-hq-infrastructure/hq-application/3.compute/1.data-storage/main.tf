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


### Managed Disks ###

# Retail, CDM and DMS disks

module "sql_ret_managed_disks" {
    source               = "../../../modules/managed_disk"
    mdisk_names          = "${var.sql_ret_mdisk_names}"
    location             = "${var.location}"
    resource_group_name  = "${var.resource_group_name}"
    storage_account_type = "${var.sql_ret_storage_account_type}"
    create_option        = "${var.sql_ret_create_option}"
    disk_size_gb         = "${var.sql_ret_disk_size_gb}"
    tags                 = "${var.tags}"
}

# TDM disks

module "sql_tdm_managed_disks" {
    source               = "../../../modules/managed_disk"
    mdisk_names          = "${var.sql_tdm_mdisk_names}"
    location             = "${var.location}"
    resource_group_name  = "${var.resource_group_name}"
    storage_account_type = "${var.sql_tdm_storage_account_type}"
    create_option        = "${var.sql_tdm_create_option}"
    disk_size_gb         = "${var.sql_tdm_disk_size_gb}"
    tags                 = "${var.tags}"
}

# Reporting Warehouse disks

module "sql_rwh_managed_disks" {
    source               = "../../../modules/managed_disk"
    mdisk_names          = "${var.sql_rwh_mdisk_names}"
    location             = "${var.location}"
    resource_group_name  = "${var.resource_group_name}"
    storage_account_type = "${var.sql_rwh_storage_account_type}"
    create_option        = "${var.sql_rwh_create_option}"
    disk_size_gb         = "${var.sql_rwh_disk_size_gb}"
    tags                 = "${var.tags}"
}


### Availabbility Sets ###

module "sql_availability_set" {
    source               = "../../../modules/availability_set"
    aset_names           = "${var.sql_aset_names}"
    location             = "${var.location}"
    resource_group_name  = "${var.resource_group_name}"
    managed              = "${var.sql_aset_managed}"
    tags                 = "${var.tags}"
}

### Virtual Machines ###

# SQL Server Virtual Machines


module "sql_server_vms" {
    source                = "../../../modules/virtual_machine_windows"
    vm_names              = "${var.sql_vm_names}"
    location              = "${var.location}"
    resource_group_name   = "${var.resource_group_name}"
    network_interface_ids = "${data.terraform_remote_state.networking_state.sql_nic_ids}"
    vm_size               = "${var.sql_vm_size}"
    availability_set_id   = "${module.sql_availability_set.aset_id[0]}"
    tags                  = "${var.tags}"
    tag_role              = "${var.tag_role}"

    publisher             = "${var.sql_publisher}"
    offer                 = "${var.sql_offer}"
    sku                   = "${var.sql_sku}"

    os_disk_name          = "${var.sql_os_disk_name}"
    create_option         = "${var.sql_create_option}"
    managed_disk_type     = "${var.sql_managed_disk_type}"

    computer_name         = "${var.sql_computer_name}"
    admin_username        = "${var.sql_admin_username}"
    admin_password        = "${var.sql_admin_password}"

    timezone              = "${var.sql_timezone}"
}
