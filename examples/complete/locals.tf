locals {
  resource_group_name         = module.resource_names["resource_group"].minimal_random_suffix
  network_security_group_name = module.resource_names["network_security_group"].minimal_random_suffix
}
