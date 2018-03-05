# terraform-ecs-cluster

This example is meant to be used as a starting template for creating 
an ECS cluster/Service and Task definition--including all VPC and networking resources. 

## Deploying

To execute a deployment:

```console
$ terrform init
```

```console
$ terraform plan -var-file=terraform.tfvars
```

```console
$ terraform apply --var-file=terraform.tfvars
```

```console
# Cleanup
$ terrform destroy
```
`

You will be prompted for your aws access key and secret. Optionally you can place this info into the tfvars file.

aws_access_key_id = "YOUR_ACCESS_KEY_ID" . 
aws_secret_access_key = "YOUR_SECRET_ACCESS_KEY"
