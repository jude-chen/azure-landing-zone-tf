root_id                         = "estf"
root_name                       = "Enterprise Scale TF"
default_location                = "southcentralus"
connectivity_resources_location = "southcentralus"
management_resources_location   = "southcentralus"
subscription_id_connectivity    = "15288672-5ab3-4934-98c2-ca822a0801da"
subscription_id_management      = "0c041013-9d26-44a1-bde1-2fe2e6134598"
subscription_id_identity        = "d96bd403-f8ed-44bb-95b2-04ba414f4277"
deploy_core_landing_zones       = true
deploy_corp_landing_zones       = true
deploy_online_landing_zones     = true
deploy_connectivity_resources   = true
deploy_identity_resources       = true
deploy_management_resources     = true
tags = {
  environment = "Prod"
  application = "estf-platform"
}
subscription_id_overrides = {
  sandboxes = ["b8983692-50a7-4a08-947a-68abed4621e1"]
}
