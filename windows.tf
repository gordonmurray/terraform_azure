variable "prefix" {
  default = "windows"
}

resource "azurerm_network_interface" "windows" {
  name                = "${var.prefix}-nic"
  location            = "${module.resource_group.resource_group_location}"
  resource_group_name = "${module.resource_group.resource_group_name}"

  ip_configuration {
    name                          = "${var.prefix}-ip-configuration"
    subnet_id                     = "${module.subnet.subnet_id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${module.public_ip_windows.public_ip_id}"
  }
}

resource "azurerm_virtual_machine" "windows" {
  name                  = "${var.prefix}-vm"
  location              = "${module.resource_group.resource_group_location}"
  resource_group_name   = "${module.resource_group.resource_group_name}"
  network_interface_ids = ["${azurerm_network_interface.windows.id}"]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2008-R2-SP1"
    version   = "latest"
  }

  storage_os_disk {
    name              = "windows_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "Windows"
    admin_username = "AdminPerson"
    admin_password = "Password12345!"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = false
  }
}
