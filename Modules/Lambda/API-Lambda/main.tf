resource "aws_lambda_function" "api-lambda" {
    filename         = "${data.archive_file.api-lambda.output_path}"
    source_code_hash = "${data.archive_file.api-lambda.output_base64sha256}"
    function_name    = "${var.function_name}"
    role             = "${aws_iam_role.assume_role.arn}"
    handler          = "api-lambda.handler"
    runtime          = "${var.runtime}"

    environment {
    variables = {
      zero_bucket = "${var.bucket-name}"
    }
    }
}  
data "archive_file" "api-lambda" {
  type        = "zip"
  source_file = "${path.module}/Python/api-lambda.py"
  output_path = "${path.module}/Files/api-lambda.zip"
}
