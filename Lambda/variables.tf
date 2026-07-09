variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "region" {
  type = string
}

variable "lambda_function_name" {
  type = string
}

variable "lambda_runtime" {
  type    = string
  default = "python3.12"
}

variable "lambda_handler" {
  type    = string
  default = "lambda_function.lambda_handler"
}

variable "lambda_timeout" {
  type    = number
  default = 60
}

variable "lambda_memory" {
  type    = number
  default = 512
}

variable "lambda_zip_path" {
  type = string
}