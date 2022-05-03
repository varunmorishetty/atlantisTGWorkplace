resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name

  tags = {
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}

variable "bucket_name" {
  type = string
  default = "atlantis-example-xyz"
}