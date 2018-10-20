resource "aws_iam_policy" "put_object_bucket" {
  name = "put_object_bucket"
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
        "${var.bucket-arn}/*"
      ]
    }
  ]
}
EOF
}


resource "aws_iam_role" "assume_role" {
  name = "assume_role"

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

resource "aws_iam_role_policy_attachment" "test-attach" {
    role       = "${aws_iam_role.assume_role.name}"
    policy_arn = "${aws_iam_policy.put_object_bucket.arn}"
}