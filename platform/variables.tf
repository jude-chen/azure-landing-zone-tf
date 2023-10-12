# Step 1. Update version of module in main.tf file and version of provider in terraform.tf to latest

# Core Resources Deployment Phase 1
# Step 2. Update the following variables after which run the following commands
# az login
# terraform init
# terraform plan
# terraform apply
# For more details see here https://github.com/Azure/terraform-azurerm-caf-enterprise-scale/wiki/%5BExamples%5D-Deploy-Demo-Landing-Zone-Archetypes

variable "root_id" {
  type    = string
  default = "Contoso"
}

variable "root_name" {
  type    = string
  default = "Contoso"
}

variable "default_location" {
  type    = string
  default = "westus2"
}

variable "connectivity_resources_location" {
  type    = string
  default = "westus2"
}

variable "management_resources_location" {
  type    = string
  default = "westus2"
}

variable "subscription_id_connectivity" {
  type    = string
  default = "11111111-1111-1111-1111-111111111111"
}

variable "subscription_id_identity" {
  type    = string
  default = "11111111-1111-1111-1111-111111111111"
}

variable "subscription_id_management" {
  type    = string
  default = "11111111-1111-1111-1111-111111111111"
}

variable "deploy_core_landing_zones" {
  type    = bool
  default = true
}

variable "deploy_corp_landing_zones" {
  type    = bool
  default = true
}

variable "deploy_online_landing_zones" {
  type    = bool
  default = true
}

# Management Resources Deployment  Phase 2
# Step 3. Update the following variable to true and udpdate settings.management.tf after which run the following commands
# terraform plan
# terraform apply
# for more details https://github.com/Azure/terraform-azurerm-caf-enterprise-scale/wiki/%5BExamples%5D-Deploy-Management-Resources-With-Custom-Settings
variable "deploy_management_resources" {
  type    = bool
  default = false
}

# Connectivity Resources Deployment  Phase 3
# Step 4. Update the following variable to true and udpdate settings.connectivity.tf after which run the following commands
# terraform plan
# terraform apply
# for more details https://github.com/Azure/terraform-azurerm-caf-enterprise-scale/wiki/%5BExamples%5D-Deploy-Connectivity-Resources-With-Custom-Settings
variable "deploy_connectivity_resources" {
  type    = bool
  default = false
}

# Identity Resources Deployment  Phase 4
# Step 5. Update the following variable to true and udpdate settings.identity.tf after which run the following commands
# terraform plan
# terraform apply
# for more details https://github.com/Azure/terraform-azurerm-caf-enterprise-scale/wiki/%5BExamples%5D-Deploy-Virtual-WAN-Resources-With-Custom-Settings
variable "deploy_identity_resources" {
  type    = bool
  default = false
}

variable "tags" {
  type = map(string)
  default = {
    environment = "Prod"
    application = "estf-platform"
  }
}
