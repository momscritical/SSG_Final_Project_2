# Create AKS Cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${var.az_prefix}_cluster"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  oidc_issuer_enabled         = true
  workload_identity_enabled   = true
  node_resource_group         = "${var.az_prefix}_node_rg"

  dns_prefix = "${var.az_prefix}Cluster"

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = var.uname

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
    network_plugin     = "kubenet"
    load_balancer_sku  = "standard"
  }

  oms_agent {
    # OMS 에이전트가 데이터를 보내야 하는 Log Analytics 작업 영역의 ID
    log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id
  }

  default_node_pool {
    name = "${var.az_basic.prefix}pool"
    vm_size = var.vm_size
    enable_auto_scaling = true
    max_count = 3
    min_count = 1
    node_count = 2
    max_pods = 30

    node_network_profile {
      allowed_host_ports {
        port_start = 80
        port_end   = 80
        protocol   = "TCP"
      }
      application_security_group_ids = [azurerm_application_security_group.basic_asg.id]
    }

    temporary_name_for_rotation = "temp"
    vnet_subnet_id             = azurerm_subnet.basic_subnet.id

    tags = {
      poolType = "${var.az_basic.prefix}pool"
    }
  }

  depends_on = [ azurerm_log_analytics_workspace.log_analytics ]
}

resource "azurerm_kubernetes_cluster_node_pool" "svc_pool" {
  name                  = "${var.az_svc.prefix}pool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size               = var.vm_size
  max_count             = 3
  min_count             = 1
  node_count            = 2
  enable_auto_scaling   = true
  vnet_subnet_id        = azurerm_subnet.svc_subnet.id

  node_network_profile {
    allowed_host_ports {
      port_start = 80
      port_end   = 80
      protocol   = "TCP"
    }
    application_security_group_ids = [azurerm_application_security_group.svc_asg.id]
  }

  tags = {
    poolType = "${var.az_svc.prefix}pool"
  }
  
  depends_on = [ azurerm_log_analytics_workspace.log_analytics ]
}