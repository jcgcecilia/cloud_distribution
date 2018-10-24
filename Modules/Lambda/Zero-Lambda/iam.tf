resource "aws_iam_policy" "get_object_zero_bucket" {
  name = "get_object_zero_bucket"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "${var.zero-bucket-arn}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_policy" "put_object_red_bucket" {
  name = "put_object_red_bucket"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject"
      ],
      "Resource": [
        "${var.red-bucket-arn}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_log" {
  name = "lambda_log"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogStream",
        "logs:CreateLogGroup",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "zero_assume_role" {
  name = "zero_assume_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "get_object_from_zero_bucket" {
    role       = "${aws_iam_role.zero_assume_role.name}"
    policy_arn = "${aws_iam_policy.put_object_red_bucket.arn}"
}

resource "aws_iam_role_policy_attachment" "put_object_in_red_bucket" {
    role       = "${aws_iam_role.zero_assume_role.name}"
    policy_arn = "${aws_iam_policy.get_object_zero_bucket.arn}"
}

resource "aws_iam_role_policy_attachment" "lambda_enable_logging" {
    role       = "${aws_iam_role.zero_assume_role.name}"
    policy_arn = "${aws_iam_policy.lambda_log.arn
    }"
}