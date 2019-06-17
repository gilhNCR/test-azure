# Variables for the Network Security Group module main.tf file

# Shared variables

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
}


# Security Rule Variables

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

variable "network_security_group_name" {
    description = "(Required) The name of the Network Security Group that we want to attach the rule to. Changing this forces a new resource to be created."
    type        = "list"
}

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}
