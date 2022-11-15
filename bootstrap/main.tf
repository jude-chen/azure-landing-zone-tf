resource "azurerm_resource_group" "rg" {
  name     = "terraform-bootstrap-rg"
  location = "southcentralus"
  tags = {
    application = "Terraform"
  }

}

resource "azurerm_storage_account" "tf_sa" {
  name                     = "judechenlztfsa01"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    application = "Terraform"
  }
}

resource "azurerm_storage_container" "tf_states" {
  name                  = "tfstates"
  storage_account_name  = azurerm_storage_account.tf_sa.name
  container_access_type = "private"
}

# service principal for pipeline
resource "azuread_application" "lztf_app" {
  display_name = "lztf-sp"
}

resource "azuread_service_principal" "lztf_sp" {
  application_id               = azuread_application.lztf_app.application_id
  app_role_assignment_required = false
}

resource "azuread_service_principal_password" "lztf_sp_password" {
  service_principal_id = azuread_service_principal.lztf_sp.object_id
}

data "azurerm_client_config" "current" {
}

data "azurerm_management_group" "root_mg" {
  name = data.azurerm_client_config.current.tenant_id
}

resource "azurerm_role_assignment" "lztf_sp_assignment" {
  scope                = data.azurerm_management_group.root_mg.id
  role_definition_name = "Owner"
  principal_id         = azuread_service_principal.lztf_sp.object_id
}
