variable "region" {
    description = "terraform region"
    type = string
    default = "us-east-01"
}

variable "environment"{
    type = string
    default = "Dev"
}

variable "bucket_name" {
    type = string
    description ="Bucket name to be used in main.tf"
    default = "s3_bucket_demo"
}