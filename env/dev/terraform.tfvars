rg_map = {
  rg1 = {
    rg_name  = "rg1"
    location = "centralindia"
  }
}

vnet_map = {
  vnet1 = {
    vnet_name     = "vnet1"
    location      = "centralindia"
    rg_name       = "rg1"
    address_space = ["10.0.0.0/16"]
  }
}

subnet_map = {
  sub1 = {
    subnet_name      = "subnet1"
    rg_name          = "rg1"
    vnet_name        = "vnet1"
    address_prefixes = ["10.0.1.0/24"]
    nsg_name         = "nsg1"
    location         = "centralindia"
  }
}

