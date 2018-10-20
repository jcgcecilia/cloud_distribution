resource "aws_lambda_function" "zero-lambda" {
    filename         = "${data.archive_file.zero½-lambda.output_path}"
    source_code_hash = "${data.archive_file.zero-lambda.output_base64sha256}"
    function_name    = "${var.function_name}"
    role             = "${aws_iam_role.assume_role.arn}"
    handler          = "zero-lambda.handler"
    runtime          = "${var.runtime}"

    environment {
    variables = {
      red-bucket =  "${var.red-bucket-name}"
    }
    }
}  
data "archive_file" "zero-lambda" {
  type        = "zip"
  source_file = "${path.module}/Python/zero-lambda.py"
  output_path = "${path.module}/Files/zero-lambda.zip"
}