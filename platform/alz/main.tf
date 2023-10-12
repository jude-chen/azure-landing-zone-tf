# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used.

# Map each module provider to their corresponding `azurerm` provider using the providers input object

module "caf-enterprise-scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "4.2.0" #UPDATE THE MODULE VERSION TO LATEST. CHECK HERE FOR LATEST VERSION https://registry.terraform.io/modules/Azure/caf-enterprise-scale/azurerm/latest

  default_location = var.default_location

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm.connectivity
    azurerm.management   = azurerm.management
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  deploy_core_landing_zones     = var.deploy_core_landing_zones
  deploy_corp_landing_zones     = var.deploy_corp_landing_zones
  deploy_online_landing_zones   = var.deploy_online_landing_zones
  deploy_identity_resources     = var.deploy_identity_resources
  deploy_management_resources   = var.deploy_management_resources
  deploy_connectivity_resources = var.deploy_connectivity_resources

  subscription_id_connectivity = data.azurerm_client_config.connectivity.subscription_id
  subscription_id_identity     = data.azurerm_client_config.identity.subscription_id
  subscription_id_management   = data.azurerm_client_config.management.subscription_id

  configure_identity_resources     = local.configure_identity_resources
  configure_management_resources   = local.configure_management_resources
  configure_connectivity_resources = local.configure_connectivity_resources

}
