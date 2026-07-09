resource "aws_s3_bucket" "demo" {
  bucket = "${var.bucket_name}-${var.environment}"

  tags = {
    Name        = "${var.bucket_name}-${var.environment}"
    Environment = var.environment
  }
}

#versioning enable
resource "aws_s3_bucket_versioning" "vdemo"{
    bucket      = aws_s3_bucket.demo.id
    versioning_configuration {
    status = "Enabled"
  }
}

#public access
resource "aws_s3_bucket_public_access_block" "demo" {
  bucket = aws_s3_bucket.demo.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#need to add env varables in hcp

#bucket_name = "my-webapp-bucket"
#environment = "dev"