# Terraform Configuration -> to be moved in a separate provider.tf file

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}


# Virtual Network and Subnet

resource "azurerm_virtual_network" "myvnet" { 
  name = "my-vnet" 
  address_space = [ "10.0.0.0/16" ] 
  location = "northeurope" 
  resource_group_name = azurerm_resource_group.rg.name 
} 

resource "azurerm_subnet" "mysubnet" { 
  name = "mySubnet" 
  resource_group_name = azurerm_resource_group.rg.name 
  virtual_network_name = azurerm_virtual_network.myvnet.name 
  address_prefixes = "10.0.1.0/24" 
}

# Public IP

resource "azurerm_public_ip" "myvm1publicip" { 
  name = "pip1" 
  location = "northeurope" 
  resource_group_name = azurerm_resource_group.rg.name 
  allocation_method = "Dynamic" 
  sku = "Basic" 
}

# Network Interface

resource "azurerm_network_interface" "myvm1nic" { 
  name = "myvm1-nic" 
  location = "northeurope" 
  resource_group_name = azurerm_resource_group.rg.name 

  ip_configuration { 
    name = "ipconfig1" 
    subnet_id = azurerm_subnet.frontendsubnet.id 
    private_ip_address_allocation = "Dynamic" 
    public_ip_address_id = azurerm_public_ip.myvm1publicip.id 
  } 
}

resource "azurerm_windows_virtual_machine" "example" {
  count                 = 9
  name                  = "myvm${count.index + 1}"
  location              = "northeurope"
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.myvm1nic.id]
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  admin_password        = "Password123!"

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}