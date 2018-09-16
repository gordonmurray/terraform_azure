resource "azurerm_public_ip" "main" {
  name                         = "${var.name}"
  location                     = "${var.location}"
  resource_group_name          = "${var.resource_group_name}"
  public_ip_address_allocation = "${var.public_ip_address_allocation}"
}

# Send outputs from this resource back out
output "public_ip_id" {
  value = "${azurerm_public_ip.main.id}"
}
