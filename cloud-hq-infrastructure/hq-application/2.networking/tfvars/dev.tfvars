### Networking variables for the DEV environment ###

### Tag variables ###

tags = {
    environment = "DEV"
    project     = "HQ"
    live        = "no"
    owner       = "Paul Campbell"
    costcentre  = "PD6727"
}

### Global Resource variables ###

resource_group_name           = "HQ-DEV"

location                      = "northeurope"

subscription_id               = "6eeb9b88-68e4-4ec7-9566-d16abb5e96f2"

### Virtual Network Resource variables ###

vn_name                       = "vn1"

address_space                 = [ "10.16.8.0/26" ]


#dns_servers                  = ""


### Subnet Resource variables ###

sn_names                      = [ "sn1" ]

address_prefixes              = [ "10.16.8.0/26" ]

### Route Table and Route Resource variables ###

route_table_names             = [ "rt1" ]

disable_bgp_route_propagation = false

route_names                   = [ "private", "public", ]

route_prefixes                = [ "10.16.8.0/26", "0.0.0.0/0" ]

route_nexthop_types           = [ "VnetLocal", "Internet" ]

### Network Security Group (Subnet) variables ###

security_group_names          = [ "subnet-nsg" ]


rule_names                    = [ "RDP-Rule" ]

priority                      = [ 500 ]

direction                     = [ "Inbound" ]

access                        = [ "Allow" ]

protocol                      = [ "Tcp" ]

source_port_range             = [ "*" ]

destination_port_range        = [ "3389" ]

source_address_prefix         = [ "10.0.0.0/8" ]

destination_address_prefix    = [ "VirtualNetwork" ]

### Network Security Group (Application) variables ###

app_security_group_names      = [ "application-nsg" ]


sql_rule_names                = [ "SQL-RDP-Rule" ]

sql_priority                  = [ 500 ]

sql_direction                 = [ "Inbound" ]

sql_access                    = [ "Allow" ]

sql_protocol                  = [ "Tcp" ]

sql_source_port_range         = [ "*" ]

sql_destination_port_range    = [ "3389" ]

sql_source_address_prefix     = [ "10.0.0.0/8" ]

sql_dest_address_prefix       = [ "VirtualNetwork" ]

### Network Security Group (Application) variables ###

app_security_group_names      = [ "application-nsg" ]


rmq_rule_names                = [ "RMQ-RDP-Rule" ]

rmq_priority                  = [ 499 ]

rmq_direction                 = [ "Inbound" ]

rmq_access                    = [ "Allow" ]

rmq_protocol                  = [ "Tcp" ]

rmq_source_port_range         = [ "*" ]

rmq_destination_port_range    = [ "3389" ]

rmq_source_address_prefix     = [ "10.0.0.0/8" ]

rmq_dest_address_prefix       = [ "VirtualNetwork" ]

### Network Security Group (Application) variables ###

app_security_group_names      = [ "application-nsg" ]


rap_rule_names                = [ "RAP-RDP-Rule" ]

rap_priority                  = [ 498 ]

rap_direction                 = [ "Inbound" ]

rap_access                    = [ "Allow" ]

rap_protocol                  = [ "Tcp" ]

rap_source_port_range         = [ "*" ]

rap_destination_port_range    = [ "3389" ]

rap_source_address_prefix     = [ "10.0.0.0/8" ]

rap_dest_address_prefix       = [ "VirtualNetwork" ]


### Network Interface Variables ###
# SQL NIC's

sql_nic_names                     = [ "sql-nic-1", "sql-nic-2", "sql-nic-3" ]

sql_enable_ip_forwarding          = [ false, false, false ]

sql_enable_accel_net              = [ false, false, false ]



sql_ip_alloc_type                 = [ "dynamic", "dynamic", "dynamic" ]

sql_ip_version                    = [ "IPv4", "IPv4", "IPv4" ]

sql_primary_ip                    = [ true, true, true ]

# RMQ NIC's

rmq_nic_names                     = [ "rmq-nic-1", "rmq-nic-2", "rmq-nic-3", "rmq-nic-4" ]

rmq_enable_ip_forwarding          = [ false, false, false, false ]

rmq_enable_accel_net              = [ false, false, false, false ]



rmq_ip_alloc_type                 = [ "dynamic", "dynamic", "dynamic", "dynamic" ]

rmq_ip_version                    = [ "IPv4", "IPv4", "IPv4", "IPv4" ]

rmq_primary_ip                    = [ true, true, true, true ]

# RAP NIC's

rap_nic_names                     = [ "rap-nic-1", "rap-nic-2", "rap-nic-3" ]

rap_enable_ip_forwarding          = [ false, false, false ]

rap_enable_accel_net              = [ false, false, false ]



rap_ip_alloc_type                 = [ "dynamic", "dynamic", "dynamic" ]

rap_ip_version                    = [ "IPv4", "IPv4", "IPv4" ]

rap_primary_ip                    = [ true, true, true ]

### Application Security Group Variables ###

asg_names                         = [ "sql-asg", "rmq-asg", "rap-asg" ]

### Load Balancer ###

rap_lb_names                      = [ "rap-lb" ]

rap_lb_sku                        = "Basic"

rap_front_lb_ip_name              = "rap-front-pool"

rap_front_ip_alloc                = "Static"

rap_front_ip_addr                 = "10.16.8.20"

rap_back_pool_name                = "rap-back-pool"

rap_nic_ip_name                    = [ "HQ-DEV-ipconfig0", "HQ-DEV-ipconfig1", "HQ-DEV-ipconfig2" ]

