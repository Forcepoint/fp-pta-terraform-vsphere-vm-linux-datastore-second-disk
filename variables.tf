variable "name" {
  type = string
  description = "The name of the VM to create. EX: TestArtifactory"
}
variable "folder" {
  type = string
  description = "The folder in vSphere to create the VM under. EX: PTA/Prod"
}
variable "vm_clone_from" {
  type = string
  description = "The folder path and name of the VM to clone from. EX: PTA/Test/template-pta-centos-7"
}
variable "vsphere_datacenter" {
  type = string
  description = "The name of the datacenter to connect to."
}
variable "vsphere_datastore" {
  type = string
  description = "The name of the datastore to use for the new virtual machine."
}
variable "vsphere_compute_cluster" {
  type = string
  description = "The name of the compute cluster to use for the new virtual machine."
  /*
  This term is a bit confusing, but generally refers to the Datacenter's cluster you wish to use.
  Not to be confused with datastore clusters.
  Read up on in the Terraform docs. https://www.terraform.io/docs/providers/vsphere/r/compute_cluster.html
  */
}
variable "num_cpus" {
  type = number
  default = 1
  description = "The total number of virtual processor cores to assign to this virtual machine."
}
variable "memory" {
  type = number
  default = 4096
  description = "The size of the virtual machine's memory, in MB."
}
variable "second_disk_size" {
  type = number
  default = 500
  description = "Size of the second disk (in GB)."
}
variable "second_disk_type" {
  type = string
  default = "thin"
  description = "The type of second disk to create. Can be one of eagerZeroedThick, lazy, or thin. Default: eagerZeroedThick."
}
variable "time_zone" {
  type = string
  description = "The timezone to set in the OS. EX: MST7MDT"
}
variable "vlan_main" {
  type = string
  description = "The name of the vSphere network to attach as a Network Adapter to the VM."
}
variable "domain" {
  type = string
  description = "The domain name for this machine. This, along with host_name, make up the FQDN of this virtual machine. EX: COMPANY.com"
}
variable "dns_suffix_list" {
  type = list(string)
  default = null
  description = "A list of DNS search domains to add to the DNS configuration on the virtual machine. If the VM has Windows, use win_dns_domain instead. EX: [\"COMPANY.com\"]"
}
variable "dns_server_list" {
  type = list(string)
  default = null
  description = "The list of DNS servers to configure on the virtual machine. EX: [\"192.168.0.10\",\"192.168.0.11\"]"
}
variable "ipv4_address" {
  type = string
  default = null
  description = "The IPv4 address assigned to this network adapter. If left blank or not included, DHCP is used."
}
variable "ipv4_netmask" {
  type = string
  default = null
  description = "The IPv4 subnet mask, in bits (example: 24 for 255.255.255.0)."
}
variable "ipv4_gateway" {
  type = string
  description = "The IPv4 Gateway to communicate with to get the DHCP address for the VM's network."
}
variable "ipv6_address" {
  type = string
  default = null
  description = "The IPv6 address assigned to this network adapter. If left blank or not included, auto-configuration is used."
}
variable "ipv6_netmask" {
  type = string
  default = null
  description = "The IPv6 subnet mask, in bits (example: 32)."
}
variable "ipv6_gateway" {
  type = string
  default = null
  description = "The IPv6 Gateway to communicate with to get the DHCP address for the VM's network."
}
variable "win_product_key" {
  type = string
  default = null
  description = "[WINDOWS ONLY] The product key for this virtual machine."
}
variable "win_full_name" {
  type = string
  default = null
  description = "[WINDOWS ONLY] The full name of the user of this virtual machine. This populates the 'user' field in the general Windows system information. Default: Administrator."
}
variable "win_admin_password" {
  type = string
  default = null
  description = "[WINDOWS ONLY] The administrator password for this virtual machine."
}
variable "win_dns_domain" {
  type = string
  default = null
  description = "[WINDOWS ONLY] Network interface-specific DNS search domain for Windows operating systems."
}
variable "win_workgroup" {
  type = string
  default = null
  description = "[WINDOWS ONLY] The workgroup name for this virtual machine. One of this or win_join_domain must be included. If used, this is generally set to 'WORKGROUP'."
}
variable "win_join_domain" {
  type = string
  default = null
  description = "[WINDOWS ONLY] The domain to join for this virtual machine. One of this or win_workgroup must be included."
}
variable "win_domain_admin_user" {
  type = string
  default = null
  description = "[WINDOWS ONLY] The user of the domain administrator used to join this virtual machine to the domain. Required if you are setting win_join_domain."
}
variable "win_domain_admin_password" {
  type = string
  default = null
  description = "[WINDOWS ONLY] The password of the domain administrator used to join this virtual machine to the domain. Required if you are setting win_join_domain."
}
variable "nested_hv_enabled" {
  type = bool
  default = null
  description = "This is required if you need to run Packer on the VM to produce other virtual machines directly on the VM."
}
variable "clone_timeout" {
  type = number
  default = null
  description = " The amount of time, in minutes, to wait for an available IP address on this virtual machine's NICs."
}
variable "customize_timeout" {
  type = number
  default = null
  description = "The time, in minutes that Terraform waits for customization to complete before failing."
}
variable "wait_for_guest_net_timeout" {
  type = number
  default = null
  description = "The amount of time, in minutes, to wait for an available IP address on this virtual machine's NICs."
}
variable "shutdown_wait_timeout" {
  type = number
  default = null
  description = "The amount of time, in minutes, to wait for a graceful guest shutdown when making necessary updates to the virtual machine."
}