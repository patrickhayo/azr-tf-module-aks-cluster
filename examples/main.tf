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
