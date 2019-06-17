# Network Security Group Association

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
    subnet_id                 = "${var.subnet_id[count.index]}"
    network_security_group_id = "${var.network_security_group_id[count.index]}"
}



