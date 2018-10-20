resource "aws_s3_bucket" "zero-bucket" {
    bucket = "${var.bucket-name}"
    acl    = "private"

    force_destroy = true
    
    server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
    tags {
      Name        = "My bucket"
      Environment = "Dev"
    }
}


#resource "aws_s3_bucket_notification" "zero_bucket_notification" {
#  bucket = "${aws_s3_bucket.zero-bucket.id}"
# 
#  lambda_function {
    # Remember lambda ARN
#    lambda_function_arn = "${aws_lambda_function.func.arn}"
#    events              = ["s3:ObjectCreated:*"]
#    filter_prefix       = "AWSLogs/"
#    filter_suffix       = ".log"
#  }

#}