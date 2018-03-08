provider "aws" {
  region     = "${var.aws_region}"
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

/var/jenkins_home/terraform.tfvars
