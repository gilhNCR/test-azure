# Storage Account

resource "azurerm_storage_account" "sa" {
    name                     = "${var.name}"
    resource_group_name      = "${var.resource_group_name}"
    location                 = "${var.location}"
    account_tier             = "${var.account_tier}"
    account_replication_type = "${var.account_replication_type}"

    tags     = {
        environment = "${var.tags["environment"]}"
        project     = "${var.tags["project"]}"
        live        = "${var.tags["live"]}"
        owner       = "${var.tags["owner"]}"
        costcentre  = "${var.tags["costcentre"]}"

    }
}