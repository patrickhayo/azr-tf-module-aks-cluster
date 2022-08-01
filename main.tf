terraform {
  required_version = ">=0.14.9"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.15.1"
    }
  }
}

locals {
  module_tag = {
    "module" = basename(abspath(path.module))
  }
  tags = merge(var.tags, local.module_tag)
}

resource "azurerm_kubernetes_cluster" "this" {
  name                                = var.name
  location                            = var.location
  resource_group_name                 = var.resource_group_name
  node_resource_group                 = "${var.resource_group_name}_NODES"
  kubernetes_version                  = var.kubernetes_version
  dns_prefix                          = var.dns_prefix
  private_cluster_enabled             = var.private_cluster_enabled
  private_dns_zone_id                 = var.private_dns_zone_id
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled
  automatic_channel_upgrade           = var.automatic_channel_upgrade
  sku_tier                            = var.sku_tier

  default_node_pool {
    name                   = var.default_node_pool_name
    vm_size                = var.default_node_pool_vm_size
    vnet_subnet_id         = var.vnet_subnet_id
    zones                  = var.default_node_pool_availability_zones
    node_labels            = var.default_node_pool_node_labels
    node_taints            = var.default_node_pool_node_taints
    enable_auto_scaling    = var.default_node_pool_enable_auto_scaling
    enable_host_encryption = var.default_node_pool_enable_host_encryption
    enable_node_public_ip  = var.default_node_pool_enable_node_public_ip
    max_pods               = var.default_node_pool_max_pods
    max_count              = var.default_node_pool_max_count
    min_count              = var.default_node_pool_min_count
    node_count             = var.default_node_pool_node_count
    os_disk_type           = var.default_node_pool_os_disk_type
    tags                   = var.tags
  }

  linux_profile {
    admin_username = var.admin_username
    ssh_key {
      key_data = var.ssh_public_key
    }

  }

  identity {
    type = var.identity_id == null ? "SystemAssigned" : "UserAssigned"
    identity_ids = var.identity_name == null ? [
      var.identity_id
    ] : null
  }

  # identity {
  #   type = "UserAssigned"
  #   identity_ids = [
  #     data.azurerm_user_assigned_identity.this.id
  #   ]
  # }

  network_profile {
    docker_bridge_cidr = var.network_docker_bridge_cidr
    dns_service_ip     = var.network_dns_service_ip
    network_plugin     = var.network_plugin
    network_policy     = var.network_plugin != "azure" ? "calico" : "azure"
    outbound_type      = var.outbound_type
    service_cidr       = var.network_service_cidr
  }

  http_application_routing_enabled = var.http_application_routing_enabled
  azure_policy_enabled             = var.network_plugin != "azure" ? false : var.azure_policy_enabled

  dynamic "microsoft_defender" {
    for_each = var.microsoft_defender_enabled == true ? [1] : []
    content {
      log_analytics_workspace_id = coalesce(var.oms_agent.log_analytics_workspace_id, var.log_analytics_workspace_id)
    }
  }
  dynamic "aci_connector_linux" {
    for_each = var.aci_connector_linux.enabled == true ? [1] : []
    content {
      subnet_name = var.aci_connector_linux.subnet_name
    }
  }

  dynamic "ingress_application_gateway" {
    for_each = var.ingress_application_gateway.enabled == true ? [1] : []
    content {
      gateway_id   = var.ingress_application_gateway.gateway_id
      gateway_name = var.ingress_application_gateway.gateway_name
      subnet_cidr  = var.ingress_application_gateway.subnet_cidr
      subnet_id    = var.ingress_application_gateway.subnet_id
    }
  }

  dynamic "oms_agent" {
    for_each = var.oms_agent.enabled == true ? [1] : []
    content {
      log_analytics_workspace_id = coalesce(var.oms_agent.log_analytics_workspace_id, var.log_analytics_workspace_id)
    }
  }

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = var.role_based_access_control_enabled == true ? [1] : []
    content {
      managed                = true
      tenant_id              = var.tenant_id
      admin_group_object_ids = var.admin_group_object_ids
      azure_rbac_enabled     = var.azure_rbac_enabled
    }
  }

  lifecycle {
    ignore_changes = [
      kubernetes_version,
      tags
    ]
  }
}
