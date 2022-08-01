# azr-tf-module-aks-cluster

[Terraform](https://www.terraform.io) Module to create **Azure Kubernetes Service (AKS)** in Azure

<!-- BEGIN_TF_DOCS -->
## Prerequisites

- [Terraform](https://releases.hashicorp.com/terraform/) v0.12+

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.15.1 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.14.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.15.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_service_versions.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_service_versions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | (Optional) DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the location where the AKS cluster will be deployed. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | (Optional) The ID of the Log Analytics Workspace which the OMS Agent should send data to. Must be present if enabled is true. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the AKS cluster. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Specifies the name of the resource group. | `string` | n/a | yes |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | (Required) Specifies the SSH public key used to access the cluster. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | (Required) The tenant id of the system assigned identity which is used by master components. | `string` | n/a | yes |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | (Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_aci_connector_linux"></a> [aci\_connector\_linux](#input\_aci\_connector\_linux) | (Optional) Specifies the ACI connector addon configuration. | <pre>object({<br>    enabled     = bool<br>    subnet_name = string<br>  })</pre> | <pre>{<br>  "enabled": false,<br>  "subnet_name": null<br>}</pre> | no |
| <a name="input_admin_group_object_ids"></a> [admin\_group\_object\_ids](#input\_admin\_group\_object\_ids) | (Optional) A list of Object IDs of Azure Active Directory Groups which should have Admin Role on the Cluster. | `list(string)` | `[]` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | (Required) Specifies the Admin Username for the AKS cluster worker nodes. Changing this forces a new resource to be created. | `string` | `"azadmin"` | no |
| <a name="input_automatic_channel_upgrade"></a> [automatic\_channel\_upgrade](#input\_automatic\_channel\_upgrade) | (Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, and stable. | `string` | `"stable"` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | (Optional) Specifies the Azure Policy addon configuration. | `bool` | `false` | no |
| <a name="input_azure_rbac_enabled"></a> [azure\_rbac\_enabled](#input\_azure\_rbac\_enabled) | (Optional) Is Role Based Access Control based on Azure AD enabled? | `bool` | `true` | no |
| <a name="input_default_node_pool_enable_auto_scaling"></a> [default\_node\_pool\_enable\_auto\_scaling](#input\_default\_node\_pool\_enable\_auto\_scaling) | (Optional) Whether to enable auto-scaler. Defaults to false. | `bool` | `false` | no |
| <a name="input_default_node_pool_enable_host_encryption"></a> [default\_node\_pool\_enable\_host\_encryption](#input\_default\_node\_pool\_enable\_host\_encryption) | (Optional) Should the nodes in this Node Pool have host encryption enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_default_node_pool_enable_node_public_ip"></a> [default\_node\_pool\_enable\_node\_public\_ip](#input\_default\_node\_pool\_enable\_node\_public\_ip) | (Optional) Should each node have a Public IP Address? Defaults to false. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_default_node_pool_max_count"></a> [default\_node\_pool\_max\_count](#input\_default\_node\_pool\_max\_count) | (Required) The maximum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be greater than or equal to min\_count. | `number` | `10` | no |
| <a name="input_default_node_pool_max_pods"></a> [default\_node\_pool\_max\_pods](#input\_default\_node\_pool\_max\_pods) | (Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created. | `number` | `50` | no |
| <a name="input_default_node_pool_min_count"></a> [default\_node\_pool\_min\_count](#input\_default\_node\_pool\_min\_count) | (Required) The minimum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be less than or equal to max\_count. | `number` | `3` | no |
| <a name="input_default_node_pool_name"></a> [default\_node\_pool\_name](#input\_default\_node\_pool\_name) | (Required) The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created. | `string` | `"system"` | no |
| <a name="input_default_node_pool_node_count"></a> [default\_node\_pool\_node\_count](#input\_default\_node\_pool\_node\_count) | (Optional) The initial number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be a value in the range min\_count - max\_count. | `number` | `3` | no |
| <a name="input_default_node_pool_node_labels"></a> [default\_node\_pool\_node\_labels](#input\_default\_node\_pool\_node\_labels) | (Optional) A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g key=value:NoSchedule). Changing this forces a new resource to be created. | `map(any)` | `{}` | no |
| <a name="input_default_node_pool_node_taints"></a> [default\_node\_pool\_node\_taints](#input\_default\_node\_pool\_node\_taints) | (Optional) A map of Kubernetes labels which should be applied to nodes in this Node Pool. Changing this forces a new resource to be created. | `list(string)` | `[]` | no |
| <a name="input_default_node_pool_os_disk_type"></a> [default\_node\_pool\_os\_disk\_type](#input\_default\_node\_pool\_os\_disk\_type) | (Optional) The type of disk which should be used for the Operating System. Possible values are Ephemeral and Managed. Defaults to Managed. Changing this forces a new resource to be created. | `string` | `"Ephemeral"` | no |
| <a name="input_default_node_pool_subnet_name"></a> [default\_node\_pool\_subnet\_name](#input\_default\_node\_pool\_subnet\_name) | (Required) Specifies the name of the subnet that hosts the default node pool | `string` | `"SystemSubnet"` | no |
| <a name="input_default_node_pool_vm_size"></a> [default\_node\_pool\_vm\_size](#input\_default\_node\_pool\_vm\_size) | (Required) The size of the Virtual Machine, such as Standard\_DS2\_v2. Changing this forces a new resource to be created. | `string` | `"Standard_F8s_v2"` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | (Optional) Specifies the HTTP Application Routing addon configuration. | `bool` | `false` | no |
| <a name="input_identity_id"></a> [identity\_id](#input\_identity\_id) | (Optional) Specifies the ID of the AKS cluster Identiy. | `string` | `null` | no |
| <a name="input_ingress_application_gateway"></a> [ingress\_application\_gateway](#input\_ingress\_application\_gateway) | (Optional) Specifies the Application Gateway Ingress Controller addon configuration. | <pre>object({<br>    enabled      = bool<br>    gateway_id   = string<br>    gateway_name = string<br>    subnet_cidr  = string<br>    subnet_id    = string<br>  })</pre> | <pre>{<br>  "enabled": false,<br>  "gateway_id": null,<br>  "gateway_name": null,<br>  "subnet_cidr": null,<br>  "subnet_id": null<br>}</pre> | no |
| <a name="input_kube_dashboard"></a> [kube\_dashboard](#input\_kube\_dashboard) | (Optional) Specifies the Kubernetes Dashboard addon configuration. | <pre>object({<br>    enabled = bool<br>  })</pre> | <pre>{<br>  "enabled": false<br>}</pre> | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | (Optional) Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). | `string` | `"latest"` | no |
| <a name="input_microsoft_defender_enabled"></a> [microsoft\_defender\_enabled](#input\_microsoft\_defender\_enabled) | Enable Microsoft Defener addon | `bool` | `false` | no |
| <a name="input_network_dns_service_ip"></a> [network\_dns\_service\_ip](#input\_network\_dns\_service\_ip) | (Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created. | `string` | `""` | no |
| <a name="input_network_docker_bridge_cidr"></a> [network\_docker\_bridge\_cidr](#input\_network\_docker\_bridge\_cidr) | (Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created. | `string` | `""` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | (Required) Network plugin to use for networking. Currently supported values are azure, kubenet and none. Changing this forces a new resource to be created. | `string` | `"azure"` | no |
| <a name="input_network_service_cidr"></a> [network\_service\_cidr](#input\_network\_service\_cidr) | (Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created. | `string` | `""` | no |
| <a name="input_oms_agent"></a> [oms\_agent](#input\_oms\_agent) | (Optional) Specifies the OMS agent addon configuration. | <pre>object({<br>    enabled                    = bool<br>    log_analytics_workspace_id = string<br>  })</pre> | <pre>{<br>  "enabled": true,<br>  "log_analytics_workspace_id": null<br>}</pre> | no |
| <a name="input_outbound_type"></a> [outbound\_type](#input\_outbound\_type) | (Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer and userDefinedRouting. Defaults to loadBalancer. | `string` | `"loadBalancer"` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | (Optional) Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_private_cluster_public_fqdn_enabled"></a> [private\_cluster\_public\_fqdn\_enabled](#input\_private\_cluster\_public\_fqdn\_enabled) | (Optional) Specifies whether a Public FQDN for this Private Cluster should be added. Defaults to false. | `bool` | `false` | no |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | (Optional) Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | (Required) Is Role Based Access Control Enabled? Changing this forces a new resource to be created. | `bool` | `true` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | (Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid (which includes the Uptime SLA). Defaults to Free. | `string` | `"Free"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Specifies the tags of the bastion host | `map` | `{}` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | (Optional) Specifies the availability zones of the default node pool | `list(string)` | <pre>[<br>  "1",<br>  "2",<br>  "3"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_identity_principal_id"></a> [aks\_identity\_principal\_id](#output\_aks\_identity\_principal\_id) | Specifies the principal id of the managed identity of the AKS cluster. |
| <a name="output_id"></a> [id](#output\_id) | Specifies the resource id of the AKS cluster. |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | Contains the Kubernetes config to be used by kubectl and other compatible tools. |
| <a name="output_kubelet_identity_object_id"></a> [kubelet\_identity\_object\_id](#output\_kubelet\_identity\_object\_id) | Specifies the object id of the kubelet identity of the AKS cluster. |
| <a name="output_name"></a> [name](#output\_name) | Specifies the name of the AKS cluster. |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | Specifies the resource id of the auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. |
| <a name="output_private_fqdn"></a> [private\_fqdn](#output\_private\_fqdn) | The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster. |

## Example

```hcl
resource "azurerm_resource_group" "this" {
  name     = uuid()
  location = "westeurope"
}

module "aks" {
  source = "./module"

  name                              = "myAKSCluster"
  location                          = azurerm_resource_group.this.location
  resource_group_name               = azurerm_resource_group.this.name
  vnet_subnet_id                    = "myAKSClusterSubnetId"
  node_pool_name                    = "system"
  enable_auto_scaling               = true
  max_pods                          = 30
  max_count                         = 10
  min_count                         = 2
  admin_username                    = "myUserName"
  key_data                          = "myOpenSslPublicKey"
  network_policy                    = "calico"
  role_based_access_control_enabled = true
  tags = {
    "description" = "Powered by Terraform"
  }
}
```


<!-- END_TF_DOCS -->
## Authors

Originally created by [Patrick Hayo](http://github.com/patrickhayo)

## License

[MIT](LICENSE) License - Copyright (c) 2022 by the Author.
