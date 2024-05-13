############################## AWS ##############################
data "aws_vpc" "vpc" {
  filter {
    name   = "cidr"
    values = ["10.0.0.0/16"] 
  }

  filter {
    name   = "tag:Name"
    values = ["Final-VPC"]
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