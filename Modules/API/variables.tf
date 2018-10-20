variable "name" {
  description = "The name of the REST API"
  default = "jcgc-API"
}

variable "stage_name" {
  description = "The stage name for the API deployment (production/staging/etc..)"
  default = "test"
}

variable "method" {
  description = "The HTTP method"
  default     = "POST"
}


variable "lambda_arn" {
  description = "Lambda ARN"
}


variable "lambda_invoke_arn" {
  description = "Lambda Invoke ARN"
}