module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "6.0.0"

  function_name                           = "ecommerce-lambda-endpoint"
  description                             = "A lambda to serve the API for the e-commerce application."
  handler                                 = "handler.handler"
  runtime                                 = "python3.10"
  create_package                          = false
  local_existing_package                  = "build/lambda.zip"
  tracing_mode                            = "Active"
  create_current_version_allowed_triggers = false
  allowed_triggers = {
    AllowExecutionFromAPIGateway = {
      service    = "apigateway"
      source_arn = "${module.api_gateway.apigatewayv2_api_execution_arn}/*/*"
    }
  }
  timeout = 30
}

#tfsec:ignore:aws-cloudwatch-log-group-customer-key
resource "aws_cloudwatch_log_group" "api_gateway_log_group" {
  name = "ecommerce-apigateway-logs"
}

module "api_gateway" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "2.2.2"

  name          = "ecommerce-apigateway"
  description   = "API Gateway for the e-commerce application."
  protocol_type = "HTTP"

  default_stage_access_log_destination_arn = aws_cloudwatch_log_group.api_gateway_log_group.arn
  default_stage_access_log_format          = "$context.identity.sourceIp - - [$context.requestTime] \"$context.httpMethod $context.routeKey $context.protocol\" $context.status $context.responseLength $context.requestId $context.integrationErrorMessage"

  create_api_domain_name = false

  # Routes and integrations
  integrations = {
    "$default" = {
      lambda_arn = module.lambda_function.lambda_function_arn
    }
  }

  tags = {
    Name = "http-apigateway"
  }
}