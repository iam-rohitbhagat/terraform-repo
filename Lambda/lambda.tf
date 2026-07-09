resource "aws_lambda_function" "lambda" {

  function_name = var.lambda_function_name

  filename = var.lambda_zip_path

  source_code_hash = filebase64sha256(var.lambda_zip_path)

  role = aws_iam_role.lambda_role.arn

  handler = var.lambda_handler

  runtime = var.lambda_runtime

  timeout = var.lambda_timeout

  memory_size = var.lambda_memory

  publish = true

  reserved_concurrent_executions = 10

  environment {

    variables = {

      ENVIRONMENT = var.environment

      PROJECT = var.project_name

    }

  }
# AWS X-Ray is a monitoring service that tracks the journey of a request through your application.
  tracing_config {

    mode = "Active"

  }
#This ensures the log group exists with the retention settings you defined before the Lambda is created.
  depends_on = [

    aws_cloudwatch_log_group.lambda_logs

  ]

}