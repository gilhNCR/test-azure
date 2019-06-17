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

module "sql_subnet_rules" {
    source                        = "../../modules/application_network_security_group_rule"
    rule_names                    = "${var.sql_rule_names}"
    priority                      = "${var.sql_priority}"
    direction                     = "${var.sql_direction}"
    access                        = "${var.sql_access}"
    protocol                      = "${var.sql_protocol}"
    source_port_range             = "${var.sql_source_port_range}"
    destination_port_range        = "${var.sql_destination_port_range}"
    source_address_prefix         = "${var.sql_source_address_prefix}"
    resource_group_name           = "${var.resource_group_name}"
    network_security_group_name   = "${module.nsg_application.nsg_name}"
    tags                          = "${var.tags}"
    asg_ids                       = ["${module.application_security_groups.asg_id[0]}"]
}

module "rmq_subnet_rules" {
    source                        = "../../modules/application_network_security_group_rule"
    rule_names                    = "${var.rmq_rule_names}"
    priority                      = "${var.rmq_priority}"
    direction                     = "${var.rmq_direction}"
    access                        = "${var.rmq_access}"
    protocol                      = "${var.rmq_protocol}"
    source_port_range             = "${var.rmq_source_port_range}"
    destination_port_range        = "${var.rmq_destination_port_range}"
    source_address_prefix         = "${var.rmq_source_address_prefix}"
    resource_group_name           = "${var.resource_group_name}"
    network_security_group_name   = "${module.nsg_application.nsg_name}"
    tags                          = "${var.tags}"
    asg_ids                       = ["${module.application_security_groups.asg_id[1]}"]
}

module "rap_subnet_rules" {
    source                        = "../../modules/application_network_security_group_rule"
    rule_names                    = "${var.rap_rule_names}"
    priority                      = "${var.rap_priority}"
    direction                     = "${var.rap_direction}"
    access                        = "${var.rap_access}"
    protocol                      = "${var.rap_protocol}"
    source_port_range             = "${var.rap_source_port_range}"
    destination_port_range        = "${var.rap_destination_port_range}"
    source_address_prefix         = "${var.rap_source_address_prefix}"
    resource_group_name           = "${var.resource_group_name}"
    network_security_group_name   = "${module.nsg_application.nsg_name}"
    tags                          = "${var.tags}"
    asg_ids                       = ["${module.application_security_groups.asg_id[2]}"]
}

### Network Security Group Association ###
module "nsg_subnet_association" {
    source                        = "../../modules/network_security_group_association"
    subnet_id                     = "${module.subnet.sn_id}"
    network_security_group_id     = "${module.nsg_subnet.nsg_id}"
}

### Network Interfaces ###
# SQL NIC's

 module "sql_network_interfaces" {
     source                       = "../../modules/network_interface"
     nic_names                    = "${var.sql_nic_names}"
     resource_group_name          = "${var.resource_group_name}"
     location                     = "${var.location}"
     enable_ip_forwarding         = "${var.sql_enable_ip_forwarding}"
     enable_accel_net             = "${var.sql_enable_accel_net}"
     tags                         = "${var.tags}"

     ip_subnet_id                 = ["${module.subnet.sn_id}","${module.subnet.sn_id}","${module.subnet.sn_id}"]
     ip_alloc_type                = "${var.sql_ip_alloc_type}"
     ip_version                   = "${var.sql_ip_version}"
     primary_ip                   = "${var.sql_primary_ip}"
 }

# RMQ NIC's
 module "rmq_network_interfaces" {
     source                       = "../../modules/network_interface"
     nic_names                    = "${var.rmq_nic_names}"
     resource_group_name          = "${var.resource_group_name}"
     location                     = "${var.location}"
     enable_ip_forwarding         = "${var.rmq_enable_ip_forwarding}"
     enable_accel_net             = "${var.rmq_enable_accel_net}"
     tags                         = "${var.tags}"

     ip_subnet_id                 = ["${module.subnet.sn_id}","${module.subnet.sn_id}","${module.subnet.sn_id}","${module.subnet.sn_id}"]
     ip_alloc_type                = "${var.rmq_ip_alloc_type}"
     ip_version                   = "${var.rmq_ip_version}"
     primary_ip                   = "${var.rmq_primary_ip}"
 }

# RAP NIC's
  module "rap_network_interfaces" {
     source                       = "../../modules/network_interface"
     nic_names                    = "${var.rap_nic_names}"
     resource_group_name          = "${var.resource_group_name}"
     location                     = "${var.location}"
     enable_ip_forwarding         = "${var.rap_enable_ip_forwarding}"
     enable_accel_net             = "${var.rap_enable_accel_net}"
     tags                         = "${var.tags}"

     ip_subnet_id                 = ["${module.subnet.sn_id}","${module.subnet.sn_id}","${module.subnet.sn_id}"]
     ip_alloc_type                = "${var.rap_ip_alloc_type}"
     ip_version                   = "${var.rap_ip_version}"
     primary_ip                   = "${var.rap_primary_ip}"
 }


 ### Load Balancer ###

 module "rap_load_balancer" {
     source               = "../../modules/load_balancer"
     lb_names             = "${var.rap_lb_names}"
     resource_group_name  = "${var.resource_group_name}"
     location             = "${var.location}"
     lb_sku               = "${var.rap_lb_sku}"

     front_lb_ip_name     = "${var.rap_front_lb_ip_name}"
     front_subnet_id      = "${module.subnet.sn_id[0]}"
     front_ip_alloc       = "${var.rap_front_ip_alloc}"
     front_ip_addr        = "${var.rap_front_ip_addr}"

     tags                 = "${var.tags}"

     lb_id                = "${module.rap_load_balancer.lb_id[0]}"
     back_pool_name       = "${var.rap_back_pool_name}"

     network_interface_id = ["${module.rap_network_interfaces.nic_id}"]
     nic_ip_name          = "${var.rap_nic_ip_name}"



 }