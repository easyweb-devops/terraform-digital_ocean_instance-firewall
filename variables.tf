variable "firewall_configuration" {
  type = object({
    name = string
    ingress = list(object({
      protocol         = string
      port_range       = string
      source_addresses = list(string)
    }))
    egress = list(object({
      protocol              = string
      port_range            = string
      destination_addresses = list(string)

    }))
  })
}


variable "project_name" {
  type    = string
  default = "chasiotis"
}
variable "droplet_id" {
  type = string
}
