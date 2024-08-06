resource "azurerm_subnet" "sub" {
    for_each = var.subnet_map
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_network_security_group" "nsg" {
  depends_on = [ azurerm_subnet.sub ]
    for_each = var.subnet_map
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
}

resource "azurerm_subnet_network_security_group_association" "example" {
  depends_on = [ azurerm_network_security_group.nsg ]
    for_each = var.subnet_map
  subnet_id                 = azurerm_subnet.sub[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}