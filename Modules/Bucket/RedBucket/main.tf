resource "aws_s3_bucket" "red-bucket" {
    bucket = "${var.bucket-name}"
    acl    = "private"

    force_destroy = true
  
    tags {
      Name        = "Red bucket"
      Environment = "Dev"
    }
}