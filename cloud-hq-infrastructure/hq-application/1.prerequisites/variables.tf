### Resource Variables ###

variable "subscription_id" {
    description = "The subscription id for either pord or non prod"
}

variable "location" {
    description = "The location where the resource group should be created"
    default     = "northeurope"
}

variable "sa_name" {
    description = "The storage account name"
}

variable "account_tier" {
    description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium"
}

variable "account_replication_type" {
    description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS"
}

variable "sc_name" {
    description = "The storage container name"
}

variable "container_access_type" {
    description = "The 'interface' for access the container provides. Can be either blob, container or private. Defaults to private."
}


### Tag Variables ###

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}

