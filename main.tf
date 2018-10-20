variable "aws_region" {
  default = "eu-west-1"
}

provider "aws" {
  region = "${var.aws_region}"
}

module "Bucket" {
  source = "Modules/Bucket/ZeroBucket"
  bucket-name = "${var.project}-source"
}
module  "Gateway" {
  source = "Modules/API"
  lambda_arn = "${module.Lambda.lambda-arn}"
  lambda_invoke_arn = "${module.Lambda.lambda-invoke-arn}"
}

module  "Lambda" {
  source = "Modules/Lambda/API-Lambda"
  bucket-name = "${module.Bucket.bucket-name}"
  bucket-arn = "${module.Bucket.bucket-arn}"
}