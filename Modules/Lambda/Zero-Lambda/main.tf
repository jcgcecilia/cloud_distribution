resource "aws_cloudwatch_log_group" "upload_completed" {
  name = "upload_completed"
  retention_in_days = 7
}
resource "aws_lambda_function" "zero-lambda" {
    filename         = "${data.archive_file.zero-lambda.output_path}"
    source_code_hash = "${data.archive_file.zero-lambda.output_base64sha256}"
    function_name    = "${var.function_name}"
    role             = "${aws_iam_role.zero_assume_role.arn}"
    handler          = "zero-lambda.handler"
    runtime          = "${var.runtime}"

    environment {
      variables = {
        zero_bucket = "${var.zero-bucket-name}"
        red_bucket  = "${var.red-bucket-name}"
      }
    }

    depends_on = [ "aws_cloudwatch_log_group.upload_completed" ]
}  
data "archive_file" "zero-lambda" {
  type        = "zip"
  source_file = "${path.module}/Python/zero-lambda.py"
  output_path = "${path.module}/Files/zero-lambda.zip"
}


resource "aws_lambda_permission" "allow_zero_bucket" {
  statement_id  = "AllowZeroBucketInvoke"
  action        = "lambda:InvokeFunction"
  principal     = "s3.amazonaws.com"
  function_name = "${aws_lambda_function.zero-lambda.arn}"
  source_arn = "${var.zero-bucket-arn}"
}
