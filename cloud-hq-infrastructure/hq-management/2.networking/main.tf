### Network resources for HQ  in the Azure Cloud

# Provider settings

provider "azurerm" {
    subscription_id = "${var.subscription_id}"
}

# Remote State Configuration

terraform {
    backend "azurerm" {}
}


### Virtual Networks ###

module "virtual_network" {
    source               = "../../modules/virtual_network"
    vn_name              = "${var.vn_name}"
    resource_group_name  = "${var.resource_group_name}"
    address_space        = ["${var.address_space}"]
    location             = "${var.location}"
    #dns_servers         = "${var.dns_servers}"
    tags                 = "${var.tags}"
}

### Subnets ###

module "subnet" {
    source                = "../../modules/subnet"
    sn_names              = "${var.sn_names}"
    resource_group_name   = "${var.resource_group_name}"
    virtual_network_names = "${module.virtual_network.vn_name}"
    address_prefixes      = "${var.address_prefixes}"
    tags                  = "${var.tags}"
}

### Route Tables and Routes ###
# The module below creates route tables, routes and route associations.
# The length of the table names and route names parameter determine the number of route tables or routes created using the count index.

module "route_tables" {
    source                        = "../../modules/route_table"
    route_table_names             = "${var.route_table_names}"
    resource_group_name           = "${var.resource_group_name}"
    location                      = "${var.location}"
    disable_bgp_route_propagation = "${var.disable_bgp_route_propagation}"

    route_names                   = "${var.route_names}"
    route_prefixes                = "${var.route_prefixes}"
    route_nexthop_types           = "${var.route_nexthop_types}"

    subnet_id                     = "${module.subnet.sn_id}"
    route_table_id                = "${module.route_tables.rt_id}"
    tags                          = "${var.tags}"
}

 ### Application Security Groups ###

 module "application_security_groups" {
     source                        = "../../modules/application_security_group"
     asg_names                     = "${var.asg_names}"
     location                      = "${var.location}"
     resource_group_name           = "${var.resource_group_name}"
     tags                          = "${var.tags}"
 }

### Network Security Groups ###
# Subnet NSG

module "nsg_subnet" {
    source                        = "../../modules/network_security_group"
    security_group_names          = "${var.security_group_names}"
    resource_group_name           = "${var.resource_group_name}"
    location                      = "${var.location}"
    tags                          = "${var.tags}"
}

# Application NSG

module "nsg_application" {
    source                        = "../../modules/network_security_group"
    security_group_names          = "${var.app_security_group_names}"
    resource_group_name           = "${var.resource_group_name}"
    location                      = "${var.location}"
    tags                          = "${var.tags}"
}

### Network Security Group Rule Subnet ###

module "nsg_subnet_rules" {
    source                        = "../../modules/network_security_group_rule"
    rule_names                    = "${var.rule_names}"
    priority                      = "${var.priority}"
    direction                     = "${var.direction}"
    access                        = "${var.access}"
    protocol                      = "${var.protocol}"
    source_port_range             = "${var.source_port_range}"
    destination_port_range        = "${var.destination_port_range}"
    source_address_prefix         = "${var.source_address_prefix}"
    destination_address_prefix    = "${var.destination_address_prefix}"
    resource_group_name           = "${var.resource_group_name}"
    network_security_group_name   = "${module.nsg_subnet.nsg_name}"
    tags                          = "${var.tags}"
}

### Network Security Group Rule Application ###

module "ads_subnet_rules" {
    source                        = "../../modules/application_network_security_group_rule"
    rule_names                    = "${var.ads_rule_names}"
    priority                      = "${var.ads_priority}"
    direction                     = "${var.ads_direction}"
    access                        = "${var.ads_access}"
    protocol                      = "${var.ads_protocol}"
    source_port_range             = "${var.ads_source_port_range}"
    destination_port_range        = "${var.ads_destination_port_range}"
    source_address_prefix         = "${var.ads_source_address_prefix}"
    resource_group_name           = "${var.resource_group_name}"
    network_security_group_name   = "${module.nsg_application.nsg_name}"
    tags                          = "${var.tags}"
    asg_ids                       = ["${module.application_security_groups.asg_id[0]}"]
}


### Network Security Group Association ###
module "nsg_subnet_association" {
    source                        = "../../modules/network_security_group_association"
    subnet_id                     = "${module.subnet.sn_id}"
    network_security_group_id     = "${module.nsg_subnet.nsg_id}"
}

### Network Interfaces ###
# SQL NIC's

 module "ads_network_interfaces" {
     source                       = "../../modules/network_interface"
     nic_names                    = "${var.ads_nic_names}"
     resource_group_name          = "${var.resource_group_name}"
     location                     = "${var.location}"
     enable_ip_forwarding         = "${var.ads_enable_ip_forwarding}"
     enable_accel_net             = "${var.ads_enable_accel_net}"
     tags                         = "${var.tags}"

     ip_subnet_id                 = ["${module.subnet.sn_id}","${module.subnet.sn_id}"]
     ip_alloc_type                = "${var.ads_ip_alloc_type}"
     ip_version                   = "${var.ads_ip_version}"
     primary_ip                   = "${var.ads_primary_ip}"
 }
