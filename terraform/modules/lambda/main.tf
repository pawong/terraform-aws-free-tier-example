data "archive_file" "zip" {
  type        = "zip"
  source_file = "../../src/keepalive.js"
  output_path = "../../src/keepalive.zip"
}

resource "aws_lambda_function" "keepalive" {
  filename         = data.archive_file.zip.output_path
  source_code_hash = filebase64sha256(data.archive_file.zip.output_path)

  function_name = var.project_name
  role          = var.iam_role_arn
  handler       = "keepalive.handler"
  runtime       = "nodejs18.x"
  timeout       = 10
  vpc_config {
    subnet_ids         = [var.subnet_ids]
    security_group_ids = [var.security_group_id]
  }
}
