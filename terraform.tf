provider "aws" {
  region     = "${var.aws_region}"
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
}

terraform {
 backend  "s3" {
 encrypt = true
 bucket = "eric-peterson-terraform-remote-state-storage-s3"
 dynamodb_table = "terraform-state-lock-dynamo"
 region = "us-west-2"
 key = "ecs-cluster-state/terraform.tfstate"
 }
}
