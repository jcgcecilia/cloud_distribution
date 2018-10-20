output "bucket-name" {
  value = "${aws_s3_bucket.zero-bucket.bucket}"
}

output "bucket-arn" {
  value = "${aws_s3_bucket.zero-bucket.arn}"
}