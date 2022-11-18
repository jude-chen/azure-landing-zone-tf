
# Obtain client configuration from the un-aliased provider
data "azurerm_client_config" "core" {
  provider = azurerm
}

# Obtain client configuration from the "management" provider
data "azurerm_client_config" "management" {
  provider = azurerm.management
}

# Obtain client configuration from the "connectivity" provider
data "azurerm_client_config" "connectivity" {
  provider = azurerm.connectivity
}

# Map each module provider to their corresponding `azurerm` provider using the providers input object
module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "2.4.1"

  providers = {
    azurerm              = azurerm
    azurerm.management   = azurerm.management
    azurerm.connectivity = azurerm.connectivity
  }

  # Set the required input variable `root_parent_id` using the Tenant ID from the un-aliased provider
  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = "estf"
  root_name      = "Enterprise Scale TF"

  # Enable deployment of the management resources, using the management
  # aliased provider to populate the correct Subscription ID
  deploy_management_resources = true
  subscription_id_management  = data.azurerm_client_config.management.subscription_id

  # Enable deployment of the connectivity resources, using the connectivity
  # aliased provider to populate the correct Subscription ID
  deploy_connectivity_resources = true
  subscription_id_connectivity  = data.azurerm_client_config.connectivity.subscription_id

  # insert additional optional input variables here
  subscription_id_identity = "09008fd7-85f6-4ecb-842b-6d4e66fd1008"
  subscription_id_overrides = {
    landing-zones = ["6061f76a-d2e0-42ba-91c4-3b8e4a915e98"],
    sandboxes     = ["b8983692-50a7-4a08-947a-68abed4621e1"]
  }
}
