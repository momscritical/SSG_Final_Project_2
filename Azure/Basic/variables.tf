## azure ip
# 10.0.0.0/16 : virtual network
# 10.0.1.0/24 : GatewaySubnet
# 10.0.2.0/24 : endpoint subnet ( SQL server, Storage )
# DO NOT SET [delegate subnet] when you need private endpoint
# 10.0.10.0/24 : basic subnet (for aks)
# 10.0.11.0/24 : service subnet (for aks)
############################## Basic ##############################
variable "az_prefix" {
  description = "name prefix"
  type        = string
  default     = "Final"
}

variable "az_loc" {
  description = "location"
  type        = string
  default     = "japanEast"
}

############################## Vurtual Network ##############################
variable "az_vnet_ip" {
  description = "Virtual Network IP"
  type        = string
  default     = "10.0.0.0/16"
}

############################## End Point ##############################
variable "az_ep" {
  description = "Endpoint Subnet Data"

  type = object({
    prefix                  = string
    sub_ip_address          = string
    sub_service_endpoints   = list(string)
    storage_static_name     = string
    storage_static_ip       = string
    db_static_name          = string
    db_static_ip            = string
  })

  default = {
    prefix                  = "ep"
    sub_ip_address          = "10.0.2.0/24"
    sub_service_endpoints   = ["Microsoft.Sql", "Microsoft.Storage"]
    storage_static_name     = "storage_static_ip"
    storage_static_ip       = "10.0.2.100"
    db_static_name          = "db_static_ip"
    db_static_ip            = "10.0.2.101"
  }
}


############################## Database ##############################
variable "db_username" {
  description = "Azure MySQL Database Administrator Username"
  type        = string
  default     = "azureroot"
  sensitive   = true
}

variable "db_password" {
  description = "Azure MySQL Database Administrator Password"
  type        = string
  default     = "admin12345!!"
  sensitive   = true
}

############################## Role ##############################
variable "network_role_name" {
  description = "Role Name - Network Contributor"
  type        = string
  default     = "Network Contributor"
}

variable "storage_account_role_name" {
  description = "Role Name - Storage Account Contributor"
  type        = string
  default     = "Storage Account Contributor"
}

variable "sql_security_manager_role_name" {
  description = "Role Name - SQL Security Manager"
  type        = string
  default     = "SQL Security Manager"
}

variable "sql_server_contributor_role_name" {
  description = "Role Name - SQL Server Contributor"
  type        = string
  default     = "SQL Server Contributor"
}

variable "private_dns_zone_contributor_role_name" {
  description = "Role Name - Private DNS Zone Contributor"
  type        = string
  default     = "Private DNS Zone Contributor"
}

variable "dns_zone_contributor_role_name" {
  description = "Role Name - DNS Zone Contributor"
  type        = string
  default     = "DNS Zone Contributor"
}