output "api_gateway_id" {
  value = aws_api_gateway_rest_api.api_gateway.id
}

output "keepalive_dev" {
  value = "${aws_api_gateway_stage.dev.invoke_url}/keepalive"
}

output "keepalive_prod" {
  value = "${aws_api_gateway_stage.prod.invoke_url}/keepalive"
}

output "api_gateway_execution_arn" {
  value = aws_api_gateway_rest_api.api_gateway.execution_arn
}
