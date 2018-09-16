module "resource_group" {
  source   = "./modules/azure/resource_group/"
  name     = "resources"
  location = "West Europe"
}
