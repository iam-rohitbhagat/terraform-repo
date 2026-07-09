variable "region" {
    region = "us-east-1"
}

variable "environment" {
    type = string
    description = "environment where we want to create infra"
    default = "dev"
}
