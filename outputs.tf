output "lambda_arn" {
  value = module.lambda_function.lambda_function_arn
}

output "execute_api" {
  value = module.api_gateway.default_apigatewayv2_stage_invoke_url
}
