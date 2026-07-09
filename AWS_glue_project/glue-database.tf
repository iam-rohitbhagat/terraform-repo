resource "aws_glue_catalog_database" "example" {

  name = "${var.project_name}_catalog"
  
}