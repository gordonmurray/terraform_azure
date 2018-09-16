module "public_ip_windows" {
  source                       = "./modules/azure/public_ip/"
  name                         = "windows-publicIP"
  location                     = "${module.resource_group.resource_group_location}"
  resource_group_name          = "${module.resource_group.resource_group_name}"
  public_ip_address_allocation = "dynamic"
}

module "public_ip_linux" {
  source                       = "./modules/azure/public_ip/"
  name                         = "linux-publicIP"
  location                     = "${module.resource_group.resource_group_location}"
  resource_group_name          = "${module.resource_group.resource_group_name}"
  public_ip_address_allocation = "dynamic"
}
