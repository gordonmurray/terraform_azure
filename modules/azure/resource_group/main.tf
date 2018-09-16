resource "azurerm_resource_group" "main" {
  name     = "${var.name}"
  location = "${var.location}"
}

# Send outputs from this resource back out
output "resource_group_name" {
  value = "${azurerm_resource_group.main.name}"
}

output "resource_group_location" {
  value = "${azurerm_resource_group.main.location}"
}
