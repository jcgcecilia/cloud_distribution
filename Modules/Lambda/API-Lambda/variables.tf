variable "function_name" {
  description = "The name of the lambda function"
  default = "get-signed-url"
}

variable "runtime" {
  description = "The runtime of the lambda to create"
  default = "python3.6"
}

variable "bucket-name" {
  description = "IAM role attached to the Lambda Function (ARN)"
}
variable "bucket-arn" {
  description = "IAM role attached to the Lambda Function (ARN)"
}