variable "function_name" {
  description = "The name of the lambda function"
  default = "copy-object"
}

variable "runtime" {
  description = "The runtime of the lambda to create"
  default = "python3.6"
}

variable "zero-bucket-arn" {
  description = "IAM role attached to the Lambda Function (ARN)"
}

variable "zero-bucket-name" {
  description = "IAM role attached to the Lambda Function (ARN)"
}

variable "red-bucket-name" {
  description = "IAM role attached to the Lambda Function (ARN)"
}
variable "red-bucket-arn" {
  description = "IAM role attached to the Lambda Function (ARN)"
}