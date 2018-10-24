output "bucket-name" {
  value = "${aws_s3_bucket.red-bucket.bucket}"
}

output "bucket-arn" {
  value = "${aws_s3_bucket.red-bucket.arn}"
}