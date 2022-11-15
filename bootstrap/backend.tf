terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-bootstrap-rg"
    storage_account_name = "judechenlztfsa01"
    container_name       = "tfstates"
    key                  = "bootstrap.terraform.tfstate"
  }
}
