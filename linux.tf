variable "linux_prefix" {
  default = "linux"
}

data "local_file" "pem" {
  filename = "/home/ubuntu/.ssh/id_rsa.pub"
}

resource "azurerm_network_interface" "linux" {
  name                = "${var.linux_prefix}-nic"
  location            = "${module.resource_group.resource_group_location}"
  resource_group_name = "${module.resource_group.resource_group_name}"

  ip_configuration {
    name                          = "${var.linux_prefix}-ip-configuration"
    subnet_id                     = "${module.subnet.subnet_id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${module.public_ip_linux.public_ip_id}"
  }
}

resource "azurerm_virtual_machine" "linux" {
  name                  = "${var.linux_prefix}-vm"
  location              = "${module.resource_group.resource_group_location}"
  resource_group_name   = "${module.resource_group.resource_group_name}"
  network_interface_ids = ["${azurerm_network_interface.linux.id}"]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "linux_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "Ubuntu"
    admin_username = "ubuntu"
    admin_password = "Password12345!"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/ubuntu/.ssh/authorized_keys"
      key_data = "${data.local_file.pem.content}"
    }
  }
}
