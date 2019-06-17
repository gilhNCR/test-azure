# Provider settings

provider "azurerm" {
    subscription_id = "${var.subscription_id}"
}

### Remote State Configuration ###

terraform {
    backend "azurerm" {}
}

# HQ Deployment Container

module "storage_container" {
    source                = "../../modules/storage_container"
    name                  = "${var.sc_name}-${lower(var.tags["project"])}-${lower(var.tags["environment"])}"
    resource_group_name   = "${var.resource_group_name}"
    storage_account_name  = "${var.storage_account_name}${lower(var.tags["project"])}${lower(var.tags["environment"])}"
    container_access_type = "${var.container_access_type}"
    tags                  = "${var.tags}"

}

