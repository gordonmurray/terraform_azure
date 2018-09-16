resource "azurerm_virtual_network" "main" {
  name                = "${var.name}"
  address_space       = ["${var.address_space}"]
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
}

# Send outputs from this resource back out
output "virtual_network_name" {
  value = "${azurerm_virtual_network.main.name}"
}
