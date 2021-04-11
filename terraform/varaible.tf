variable "node_count" {
  type = number
  default = 1
}

variable "master_count" {
  type = number
  default = 1
}

variable "main_size" {
  type = string
  # default = "s-2vcpu-2gb"
  default = "s-2vcpu-2gb-intel"
}

variable "node_size" {
  type = string
  default = "s-1vcpu-1gb"
}
