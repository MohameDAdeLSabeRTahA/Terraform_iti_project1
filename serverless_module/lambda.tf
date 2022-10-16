resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "lambda.amazonaws.com"
                ]
            }
        }
    ]
}
EOF
}

resource "aws_lambda_function" "emil_trigger_lambda" {
  filename      = "serverless_module/compressed_code/python_script.zip"
  function_name = "email_trigger"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "python_script.lambda_handler"
  runtime       = "python3.9"
}