resource "aws_glue_job" "etl_job" {

  name = "${var.project_name}-etl-job"

  role_arn = aws_iam_role.glue_role.arn

  glue_version = "5.0"

  worker_type = "G.1X"

  number_of_workers = 2

  command {

    script_location = "s3://${aws_s3_bucket.glue_bucket.bucket}/scripts/job.py"

    python_version = "3"

  }

  default_arguments = {

    "--job-language" = "python"

    "--enable-metrics" = "true"

    "--enable-continuous-cloudwatch-log" = "true"

    "--TempDir" = "s3://${aws_s3_bucket.glue_bucket.bucket}/temp/"

  }

}