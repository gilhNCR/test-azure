### Remote State Variables ###

variable "subscription_id" {
    description = "The subscription id for either pord or non prod"
}

variable "storage_account_name" {
    description = "The storage account name"
}

variable "container_name" {
    description = "The storage container name"
}

variable "key" {
    description = "The key name is the 'folder' the state while be placed into"
}

variable "access_key" {
    description = "The access key required to access the storage account"
}

### Global Resource Variables ###

variable "location" {
    description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the virtual network."
}

### Virtual Network Resource Variables ###

variable "vn_name" {
    description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
}

variable "address_space" {
    description = "(Required) The address space that is used the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
    type        = "list"
}

# variable "dns_servers" {
#     description = "(Optional) List of IP addresses of DNS servers"
# }

### Subnet Resource Variables ###

variable "sn_names" {
    description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
    type        = "list"
}

variable "address_prefixes" {
    description = "(Required) The address prefix to use for the subnet."
    type        = "list"
}

### Route Table and Routes Variables

variable "route_table_names" {
    description = "A list of names for the route tables"
    type        = "list"
}

variable "disable_bgp_route_propagation" {
    description = "Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
}

variable "route_names" {
    description = "A list of names for the routes"
    type        = "list"
}

variable "route_prefixes" {
    description = "(Required) The destination CIDR to which the route applies"
    type        = "list"
}

variable "route_nexthop_types" {
    description = " (Required) The type of Azure hop the packet should be sent to"
    type        = "list"
}

### Network Security Group (Subnet) Variables

variable "security_group_names" {
    description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
    type        = "list"
}

variable "rule_names" {
    description = " (Required) The name of the security rule."
    type        = "list"
}

variable "priority" {
    description = "(Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule."
    type        = "list"
}

variable "direction" {
    description = "(Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound."
    type        = "list"
}

variable "access" {
    description = "(Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny."
    type        = "list"
}

variable "protocol" {
    description = "(Required) Network protocol this rule applies to. Can be Tcp, Udp or * to match both."
    type        = "list"
}

variable "source_port_range" {
    description = "(Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified."
    type        = "list"
}

variable "destination_port_range" {
    description = "(Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified."
    type        = "list"
}

variable "source_address_prefix" {
    description = "(Optional) CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified."
    type        = "list"
}

variable "destination_address_prefix" {
    description = "(Optional) CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if destination_address_prefixes is not specified."
    type        = "list"
}

### Network Security Group (Application) Variables

variable "app_security_group_names" {
    description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
    type        = "list"
}

variable "ads_rule_names" {
    description = " (Required) The name of the security rule."
    type        = "list"
}

variable "ads_priority" {
    description = "(Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule."
    type        = "list"
}

variable "ads_direction" {
    description = "(Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound."
    type        = "list"
}

variable "ads_access" {
    description = "(Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny."
    type        = "list"
}

variable "ads_protocol" {
    description = "(Required) Network protocol this rule applies to. Can be Tcp, Udp or * to match both."
    type        = "list"
}

variable "ads_source_port_range" {
    description = "(Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified."
    type        = "list"
}

variable "ads_destination_port_range" {
    description = "(Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified."
    type        = "list"
}

variable "ads_source_address_prefix" {
    description = "(Optional) CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified."
    type        = "list"
}

### Network Interface Variables

# ADS NIC's
 variable "ads_nic_names" {
     description = "The name of the network interface cards"
     type        = "list"
 }

 variable "ads_enable_ip_forwarding" {
     description = "(Optional) Enables IP Forwarding on the NIC. Defaults to false"
     type        = "list"
 }

 variable "ads_enable_accel_net" {
     description = "Optional) Enables Azure Accelerated Networking using SR-IOV. Only certain VM instance sizes are supported."
     type        = "list"
 }

 variable "ads_ip_alloc_type" {
     description = "(Required) Defines how a private IP address is assigned. Options are Static or Dynamic."
     type        = "list"
 }

 variable "ads_ip_version" {
     description = "(Optional) The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4."
     type        = "list"
 }

 variable "ads_primary_ip" {
     description = "(Optional) Is this the Primary Network Interface? If set to true this should be the first ip_configuration in the array."
     type        = "list"
 }


### Application Security Group variables ###
variable "asg_names" {
    description = "(Required) Specifies the name of the Application Security Group. Changing this forces a new resource to be created."
    type        = "list"
}


### Tag variables ###

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}