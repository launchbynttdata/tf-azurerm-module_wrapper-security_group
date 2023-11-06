
custom_rules = [{
  name                       = "allow-rdp"
  priority                   = 101
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  destination_address_prefix = "*"
  destination_port_range     = "3089"
  description                = "allow-rdp on all vms in subnet"
  source_port_range          = "*"
  source_address_prefix      = "68.62.84.115"
  }
]
use_for_each = true
