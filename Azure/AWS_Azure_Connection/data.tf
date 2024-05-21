############################## AWS ##############################
data "aws_vpc" "vpc" {
    cidr_block = var.aws_vpc_ip_block
    tags = {
        Name = "Final-VPC"
    }
}

data "aws_route_table" "rt" {
    tags = {
        Name = "Private-Routing-Table"
    }
}

############################## Azure ##############################
data "azurerm_resource_group" "rg" {
    name = "${var.az_prefix}_rg"
}

data "azurerm_virtual_network" "vnet" {
    name = "${var.az_prefix}_vnet"
    resource_group_name = "${var.az_prefix}_rg"
}