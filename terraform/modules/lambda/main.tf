data "archive_file" "zip" {
  type        = "zip"
  source_dir  = "../../src/"
  output_path = "../../src/api.zip"
}

resource "aws_lambda_function" "keepalive" {
  filename         = data.archive_file.zip.output_path
  source_code_hash = filebase64sha256(data.archive_file.zip.output_path)

  function_name = "${var.project_name}-keepalive"
  role          = var.iam_role_arn
  handler       = "keepalive.handler"
  runtime       = "nodejs18.x"
  timeout       = 10
  vpc_config {
    subnet_ids         = [var.subnet_ids]
    security_group_ids = [var.security_group_id]
  }
}

resource "aws_lambda_function" "eball" {
  filename         = data.archive_file.zip.output_path
  source_code_hash = filebase64sha256(data.archive_file.zip.output_path)

  function_name = "${var.project_name}-eball"
  role          = var.iam_role_arn
  handler       = "eball.handler"
  runtime       = "nodejs18.x"
  timeout       = 10
  vpc_config {
    subnet_ids         = [var.subnet_ids]
    security_group_ids = [var.security_group_id]
  }
}

resource "aws_lambda_alias" "alias_dev" {
  name             = "dev"
  description      = "dev"
  function_name    = aws_lambda_function.keepalive.arn
  function_version = "$LATEST"
}

resource "aws_lambda_alias" "alias_prod" {
  name             = "prod"
  description      = "prod"
  function_name    = aws_lambda_function.keepalive.arn
  function_version = "$LATEST"
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.keepalive.function_name
  principal     = "apigateway.amazonaws.com"

  # The "/*/*" portion grants access from any method on any resource
  # within the API Gateway REST API.
  source_arn = "${var.api_gateway_execution_arn}/*/*"
}

resource "aws_lambda_permission" "permission_dev" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.keepalive.function_name}:dev"
  principal     = "apigateway.amazonaws.com"

  # The "/*/*" portion grants access from any method on any resource
  # within the API Gateway REST API.
  source_arn = "${var.api_gateway_execution_arn}/*/GET/keepalive"
}

resource "aws_lambda_permission" "permission_prod" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.keepalive.function_name}:prod"
  principal     = "apigateway.amazonaws.com"

  # The "/*/*" portion grants access from any method on any resource
  # within the API Gateway REST API.
  source_arn = "${var.api_gateway_execution_arn}/*/GET/keepalive"
}


resource "aws_cloudwatch_log_group" "convert_log_group" {
  name = "/aws/lambda/${aws_lambda_function.keepalive.function_name}"
}
