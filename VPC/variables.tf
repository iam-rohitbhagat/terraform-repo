variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_cidr"{
  default = "10.0.0.0/16"
}

variable "project"{
  default = "webapp"
}

variable "from_port_1"{
  type    = number
  default = 80
}

variable "to_port_1"{
  type    = number
  default = 80
}
variable "from_port_2"{
  type    = number
  default = 443
}

variable "to_port_2"{
  type    = number
  default = 443
}