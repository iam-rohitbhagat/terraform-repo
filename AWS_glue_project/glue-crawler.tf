resource "aws_glue_crawler" "crawler" {
  database_name = aws_glue_catalog_database.example.name
  name          = "${var.project_name}-crawler"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3://${aws_s3_bucket.demo.bucket}/raw"
  }
}