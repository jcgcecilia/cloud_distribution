output "lambda-arn" {
  value = "${aws_lambda_function.api-lambda.arn}"
}


output "lambda-invoke-arn" {
  value = "${aws_lambda_function.api-lambda.invoke_arn}"
}