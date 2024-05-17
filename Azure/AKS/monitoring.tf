resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "${var.az_prefix}-acc-01"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  # Log Analytics 작업 영역에서 사용자가 작업 영역에 대한 권한 없이,
  # 보기 권한이 있는 리소스와 연결된 데이터에 액세스하도록 허용하는지 여부
  allow_resource_only_permissions = false

  # Log Analytics 작업 영역이 Azure AD를 사용하여 인증을 적용해야 하는지 여부를 지정
  local_authentication_disabled = false

  # 가격 정책
  sku                 = "PerGB2018"
  # 데이터 보존 기간 =  7(프리 티어만 해당) 또는 30~730 범위
  retention_in_days   = 30

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_monitor_workspace" "mws" {
  name = "${var.az_prefix}-Monitoring-Workspace"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_dashboard_grafana" "grafana" {
  # 기본 
  name = "${var.az_prefix}-grafana"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  grafana_major_version = "10"
  zone_redundancy_enabled = false

  # 고급
  api_key_enabled = true
  deterministic_outbound_ip_enabled = false

  # 권한
  identity {
    type = "SystemAssigned"
    # identity_ids = Grafana 대시보드에 액세스하는 ID.추가하려면, '소유자' 또는 '사용자 액세스 관리자' 구독이어야 함.
  }

  azure_monitor_workspace_integrations {
    resource_id = azurerm_monitor_workspace.mws.id
  }

  # 네트워킹
  public_network_access_enabled = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_monitor_data_collection_endpoint" "dce" {
  name                = "${var.az_prefix}-${azurerm_monitor_workspace.mws.location}-${data.azurerm_kubernetes_cluster.aks_cluster.name}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = azurerm_monitor_workspace.mws.location
  kind                = "Linux"
}