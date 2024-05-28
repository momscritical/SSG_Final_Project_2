## azure ip
# 10.1.0.0/16 : virtual network
# 10.1.1.0/24 : GatewaySubnet
# 10.1.2.0/24 : endpoint subnet ( SQL server, Storage )
# DO NOT SET [delegate subnet] when you need private endpoint
# 10.1.10.0/24 : basic subnet (for aks)
# 10.1.11.0/24 : service subnet (for aks)
############################## Basic ##############################
variable "az_prefix" {
  type        = string
  description = "name prefix"
  default     = "need"
}

variable "az_loc" {
  description = "location"
  type        = string
  default     = "japanEast"
  # koreacentral grafana 지원 안 함.
    # southcentralus,westcentralus,westeurope,eastus,eastus2,northeurope,
    # uksouth,australiaeast,swedencentral,westus,westus2,westus3,centralus,
    # southeastasia,canadacentral,centralindia,eastasia,uaenorth,japaneast,
    # francecentral,brazilsouth,norwayeast,germanywestcentral
}

############################## Vurtual Network ##############################
variable "az_vnet_ip" {
  description = "Virtual Network IP"
  type        = string
  default     = "10.1.0.0/16"
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
    sub_ip_address          = "10.1.2.0/24"
    sub_service_endpoints   = ["Microsoft.Sql", "Microsoft.Storage"]
    storage_static_name     = "storage_static_ip"
    storage_static_ip       = "10.1.2.100"
    db_static_name          = "db_static_ip"
    db_static_ip            = "10.1.2.101"
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

############################## Role Name ##############################
variable "role_names" {
    type = list(string)
    description = "role name list"
    default = [
        "Contributor",
        "Network Contributor",
        "Storage Account Contributor",
        "Storage Blob Data Contributor",
        "SQL Security Manager",
        "SQL Server Contributor",
        "Private DNS Zone Contributor",
        "DNS Zone Contributor",
        "Azure Kubernetes Service RBAC Admin",
        "Grafana Admin",
        "Monitoring Reader"
    ]
}