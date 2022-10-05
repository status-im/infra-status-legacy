variable "domain" {
  description = "DNS Domain to update"
  type        = string
  default     = "statusim.net"
}

variable "data_volume_size" {
  description = "Size of extra data volumes for nodes in GB"
  type        = number
  default     = 60
}
