module "subnet" {
  source               = "./modules/azure/subnet/"
  name                 = "internal"
  resource_group_name  = "${module.resource_group.resource_group_name}"
  virtual_network_name = "${module.virtual_network.virtual_network_name}"
  address_prefix       = "10.0.2.0/24"
}
