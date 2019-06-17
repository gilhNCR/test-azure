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

data "terraform_remote_state" "data_storage_state" {
  backend = "azurerm"

  config {
    storage_account_name = "${var.storage_account_name}"
    container_name       = "${var.container_name}"
    access_key           = "${var.access_key}"
    key                  = "compute/data-storage.tfstate"
  }
}


### Virtual Machine Data Disk Attachments

# SQL RET MDisk Attachments

# Lewis, attachments need to be moved as they need to run after disk id exist (issue with resolving count)

module "sql_ret_mdisk_attach" {
    source          = "../../modules/virtual_machine_data_disk_attachment"
    mdisk_id        = "${data.terraform_remote_state.data_storage_state.ret_mdisk_ids}"
    vm_id           = "${data.terraform_remote_state.data_storage_state.ret_vm_ids[0]}"
    lun             = "${var.ret_lun}"
}

# SQL TDM MDisk Attachments

module "sql_tdm_mdisk_attach" {
    source          = "../../modules/virtual_machine_data_disk_attachment"
    mdisk_id        = "${data.terraform_remote_state.data_storage_state.tdm_mdisk_ids}"
    vm_id           = "${data.terraform_remote_state.data_storage_state.ret_vm_ids[1]}"
    lun             = "${var.tdm_lun}"
}

# SQL RWH MDisk Attachments

module "sql_rwh_mdisk_attach" {
    source          = "../../modules/virtual_machine_data_disk_attachment"
    mdisk_id        = "${data.terraform_remote_state.data_storage_state.rwh_mdisk_ids}"
    vm_id           = "${data.terraform_remote_state.data_storage_state.ret_vm_ids[2]}"
    lun             = "${var.rwh_lun}"
}