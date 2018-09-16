resource "azurerm_subnet" "internal" {
  name                 = "${var.name}"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${var.virtual_network_name}"
  address_prefix       = "${var.address_prefix}"
}

# Send outputs from this resource back out
output "subnet_id" {
  value = "${azurerm_subnet.internal.id}"
}
