output "lambda_name" {

  value = aws_lambda_function.lambda.function_name

}

output "lambda_arn" {

  value = aws_lambda_function.lambda.arn

}


/* project_name = "sales"
environment = "prod"
region = "us-east-1"
lambda_function_name = "sales-etl"
lambda_zip_path = "lambda/lambda.zip" */