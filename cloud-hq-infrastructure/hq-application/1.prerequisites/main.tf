# Provider settings

provider "azurerm" {
    subscription_id = "${var.subscription_id}"
}


# Main Resource Group to contain EPOS Application resources

module "resource_group" {
    source          = "../../modules/resource_group"
    location        = "${var.location}"
    tags            = "${var.tags}"

}

# HQ Storage account

module "storage_account" {
    source                   = "../../modules/storage_account"
    name                     = "${var.sa_name}${lower(var.tags["project"])}${lower(var.tags["environment"])}"
    resource_group_name      = "${module.resource_group.rg_name}"
    location                 = "${var.location}"
    account_tier             = "${var.account_tier}"
    account_replication_type = "${var.account_replication_type}"
    tags                     = "${var.tags}"

}

# HQ Terraform State Container

module "storage_container" {
    source                = "../../modules/storage_container"
    name                  = "${var.sc_name}-${lower(var.tags["project"])}-${lower(var.tags["environment"])}"
    resource_group_name   = "${module.resource_group.rg_name}"
    storage_account_name  = "${module.storage_account.sa_name}"
    container_access_type = "${var.container_access_type}"
    tags                  = "${var.tags}"

}