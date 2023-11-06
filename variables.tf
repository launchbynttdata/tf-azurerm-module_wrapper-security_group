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
variable "location" {
  type        = string
  description = "(Required)Location (Azure Region) for the network security group."
}

variable "security_group_name" {
  type        = string
  description = "(Required)Network security group name"
}

variable "resource_group_name" {
  type        = string
  description = "(Required)Name of the resource group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional)The tags to associate with your network security group."
}

variable "custom_rules" {
  type        = any
  default     = []
  description = "(Optional)Security rules for the network security group using this format name = [name, priority, direction, access, protocol, source_port_range, destination_port_range, source_address_prefix, destination_address_prefix, description]"
}

variable "destination_address_prefix" {
  type        = list(string)
  default     = ["*"]
  description = "Destination address prefix to be applied to all predefined rules. list(string) only allowed one element (CIDR, `*`, source IP range or Tags). Example [\"10.0.3.0/24\"] or [\"VirtualNetwork\"]"
}

variable "destination_address_prefixes" {
  type        = list(string)
  default     = null
  description = "(Optional)Destination address prefix to be applied to all predefined rules. Example [\"10.0.3.0/32\",\"10.0.3.128/32\"]"
}

variable "predefined_rules" {
  type        = any
  default     = []
  description = "(Optional)Predefined rules"
}

variable "rules" {
  type        = map(any)
  default     = { "ActiveDirectory-AllowADDSWebServices" : ["Inbound", "Allow", "Tcp", "*", "9389", "AllowADDSWebServices"], "ActiveDirectory-AllowADGCReplication" : ["Inbound", "Allow", "Tcp", "*", "3268", "AllowADGCReplication"], "ActiveDirectory-AllowADGCReplicationSSL" : ["Inbound", "Allow", "Tcp", "*", "3269", "AllowADGCReplicationSSL"], "ActiveDirectory-AllowADReplication" : ["Inbound", "Allow", "*", "*", "389", "AllowADReplication"], "ActiveDirectory-AllowADReplicationSSL" : ["Inbound", "Allow", "*", "*", "636", "AllowADReplicationSSL"], "ActiveDirectory-AllowADReplicationTrust" : ["Inbound", "Allow", "*", "*", "445", "AllowADReplicationTrust"], "ActiveDirectory-AllowDFSGroupPolicy" : ["Inbound", "Allow", "Udp", "*", "138", "AllowDFSGroupPolicy"], "ActiveDirectory-AllowDNS" : ["Inbound", "Allow", "*", "*", "53", "AllowDNS"], "ActiveDirectory-AllowFileReplication" : ["Inbound", "Allow", "Tcp", "*", "5722", "AllowFileReplication"], "ActiveDirectory-AllowKerberosAuthentication" : ["Inbound", "Allow", "*", "*", "88", "AllowKerberosAuthentication"], "ActiveDirectory-AllowNETBIOSAuthentication" : ["Inbound", "Allow", "Udp", "*", "137", "AllowNETBIOSAuthentication"], "ActiveDirectory-AllowNETBIOSReplication" : ["Inbound", "Allow", "Tcp", "*", "139", "AllowNETBIOSReplication"], "ActiveDirectory-AllowPasswordChangeKerberes" : ["Inbound", "Allow", "*", "*", "464", "AllowPasswordChangeKerberes"], "ActiveDirectory-AllowRPCReplication" : ["Inbound", "Allow", "Tcp", "*", "135", "AllowRPCReplication"], "ActiveDirectory-AllowSMTPReplication" : ["Inbound", "Allow", "Tcp", "*", "25", "AllowSMTPReplication"], "ActiveDirectory-AllowWindowsTime" : ["Inbound", "Allow", "Udp", "*", "123", "AllowWindowsTime"], "Cassandra" : ["Inbound", "Allow", "Tcp", "*", "9042", "Cassandra"], "Cassandra-JMX" : ["Inbound", "Allow", "Tcp", "*", "7199", "Cassandra-JMX"], "Cassandra-Thrift" : ["Inbound", "Allow", "Tcp", "*", "9160", "Cassandra-Thrift"], "CouchDB" : ["Inbound", "Allow", "Tcp", "*", "5984", "CouchDB"], "CouchDB-HTTPS" : ["Inbound", "Allow", "Tcp", "*", "6984", "CouchDB-HTTPS"], "DNS-TCP" : ["Inbound", "Allow", "Tcp", "*", "53", "DNS-TCP"], "DNS-UDP" : ["Inbound", "Allow", "Udp", "*", "53", "DNS-UDP"], "DynamicPorts" : ["Inbound", "Allow", "Tcp", "*", "49152-65535", "DynamicPorts"], "ElasticSearch" : ["Inbound", "Allow", "Tcp", "*", "9200-9300", "ElasticSearch"], "FTP" : ["Inbound", "Allow", "Tcp", "*", "21", "FTP"], "HTTP" : ["Inbound", "Allow", "Tcp", "*", "80", "HTTP"], "HTTPS" : ["Inbound", "Allow", "Tcp", "*", "443", "HTTPS"], "IMAP" : ["Inbound", "Allow", "Tcp", "*", "143", "IMAP"], "IMAPS" : ["Inbound", "Allow", "Tcp", "*", "993", "IMAPS"], "Kestrel" : ["Inbound", "Allow", "Tcp", "*", "22133", "Kestrel"], "LDAP" : ["Inbound", "Allow", "Tcp", "*", "389", "LDAP"], "MSSQL" : ["Inbound", "Allow", "Tcp", "*", "1433", "MSSQL"], "Memcached" : ["Inbound", "Allow", "Tcp", "*", "11211", "Memcached"], "MongoDB" : ["Inbound", "Allow", "Tcp", "*", "27017", "MongoDB"], "MySQL" : ["Inbound", "Allow", "Tcp", "*", "3306", "MySQL"], "Neo4J" : ["Inbound", "Allow", "Tcp", "*", "7474", "Neo4J"], "POP3" : ["Inbound", "Allow", "Tcp", "*", "110", "POP3"], "POP3S" : ["Inbound", "Allow", "Tcp", "*", "995", "POP3S"], "PostgreSQL" : ["Inbound", "Allow", "Tcp", "*", "5432", "PostgreSQL"], "RDP" : ["Inbound", "Allow", "Tcp", "*", "3389", "RDP"], "RabbitMQ" : ["Inbound", "Allow", "Tcp", "*", "5672", "RabbitMQ"], "Redis" : ["Inbound", "Allow", "Tcp", "*", "6379", "Redis"], "Riak" : ["Inbound", "Allow", "Tcp", "*", "8093", "Riak"], "Riak-JMX" : ["Inbound", "Allow", "Tcp", "*", "8985", "Riak-JMX"], "SMTP" : ["Inbound", "Allow", "Tcp", "*", "25", "SMTP"], "SMTPS" : ["Inbound", "Allow", "Tcp", "*", "465", "SMTPS"], "SSH" : ["Inbound", "Allow", "Tcp", "*", "22", "SSH"], "WinRM" : ["Inbound", "Allow", "Tcp", "*", "5986", "WinRM"] }
  description = "(Optional)Standard set of predefined rules"
}

variable "source_address_prefix" {
  type        = list(string)
  default     = ["*"]
  description = "(Optional)Source address prefix to be applied to all predefined rules. list(string) only allowed one element (CIDR, `*`, source IP range or Tags). Example [\"10.0.3.0/24\"] or [\"VirtualNetwork\"]"
}

variable "source_address_prefixes" {
  type        = list(string)
  default     = null
  description = "(Optional)Source address prefix to be applied to all predefined rules. Example [\"10.0.3.0/32\",\"10.0.3.128/32\"]"
}

variable "use_for_each" {
  type        = bool
  default     = false
  description = "(Optional)Choose wheter to use 'for_each' as iteration technic to generate the rules, defaults to false so we will use 'count' for compatibilty with previous module versions, but prefered method is 'for_each'"
}
