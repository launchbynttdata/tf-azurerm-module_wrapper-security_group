// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module "nsg" {
  source  = "Azure/network-security-group/azurerm"
  version = "4.1.0"

  resource_group_name = var.resource_group_name

  security_group_name = var.security_group_name
  location            = var.location
  tags                = var.tags

  custom_rules                 = var.custom_rules
  destination_address_prefix   = var.destination_address_prefix
  destination_address_prefixes = var.destination_address_prefixes
  predefined_rules             = var.predefined_rules
  rules                        = var.rules
  source_address_prefix        = var.source_address_prefix
  source_address_prefixes      = var.source_address_prefixes

  use_for_each = var.use_for_each

}
