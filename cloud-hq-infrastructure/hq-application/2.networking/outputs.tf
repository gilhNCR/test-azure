output "sql_nic_ids" {
    value = "${module.sql_network_interfaces.nic_id}"
}

output "rmq_nic_ids" {
    value = "${module.rmq_network_interfaces.nic_id}"
}

output "rap_nic_ids" {
    value = "${module.rap_network_interfaces.nic_id}"
}

output "nsg_app_ids" {
    value = "${module.nsg_application.nsg_id}"
}