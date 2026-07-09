output "glue_database" {

  value = aws_glue_catalog_database.example.name

}

output "glue_job" {

  value = aws_glue_job.etl_job.name

}

output "crawler" {

  value = aws_glue_crawler.crawler.name

}

#project_name = "data_Engineering"
#environment = "dev"
#bucket_name = "data_Engineering-data-lake"
#region = "us-east-1"