module "virtual_network" {
  source              = "./modules/azure/virtual_network/"
  name                = "network"
  address_space       = ["10.0.0.0/16"]
  location            = "${module.resource_group.resource_group_location}"
  resource_group_name = "${module.resource_group.resource_group_name}"
}
