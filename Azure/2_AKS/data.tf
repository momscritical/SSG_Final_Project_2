# Basic과 따로 Apply를 하기 때문에, 만들어진 Data를 받아와야 함
data "azurerm_client_config" "client_config" {
}

data "azurerm_resource_group" "rg" {
  name = "${var.az_prefix}_rg"
}

data "azurerm_virtual_network" "vnet" {
  name                = "${var.az_prefix}_vnet"
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_user_assigned_identity" "uai" {
    name = "${var.az_prefix}_master_key"
    resource_group_name = "${var.az_prefix}_rg"
}