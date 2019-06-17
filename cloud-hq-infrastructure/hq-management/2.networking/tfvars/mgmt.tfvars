### Networking variables for the MGMT environment ###

### Tag variables ###

tags = {
    environment = "MGMT"
    project     = "HQ"
    live        = "no"
    owner       = "Paul Campbell"
    costcentre  = "PD6727"
}

### Global Resource variables ###

resource_group_name           = "HQ-MGMT"

location                      = "northeurope"

subscription_id               = "6eeb9b88-68e4-4ec7-9566-d16abb5e96f2"

### Virtual Network Resource variables ###

vn_name                       = "vn1"

address_space                 = [ "10.16.8.160/27" ]


#dns_servers                  = ""


### Subnet Resource variables ###

sn_names                      = [ "sn1" ]

address_prefixes              = [ "10.16.8.160/27" ]

### Route Table and Route Resource variables ###

route_table_names             = [ "rt1" ]

disable_bgp_route_propagation = false

route_names                   = [ "private", "public", ]

route_prefixes                = [ "10.16.8.160/27", "0.0.0.0/0" ]

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


ads_rule_names                = [ "ADS-RDP-Rule" ]

ads_priority                  = [ 500 ]

ads_direction                 = [ "Inbound" ]

ads_access                    = [ "Allow" ]

ads_protocol                  = [ "Tcp" ]

ads_source_port_range         = [ "*" ]

ads_destination_port_range    = [ "3389" ]

ads_source_address_prefix     = [ "10.0.0.0/8" ]

ads_dest_address_prefix       = [ "VirtualNetwork" ]


### Network Interface Variables ###
# ADS NIC's

ads_nic_names                     = [ "ads-nic-1", "ads-nic-2" ]

ads_enable_ip_forwarding          = [ false, false ]

ads_enable_accel_net              = [ false, false]



ads_ip_alloc_type                 = [ "dynamic", "dynamic" ]

ads_ip_version                    = [ "IPv4", "IPv4" ]

ads_primary_ip                    = [ true, true ]


### Application Security Group Variables ###

asg_names                         = [ "ads-asg" ]




