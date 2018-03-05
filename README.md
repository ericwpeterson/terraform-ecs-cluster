# terraform-ecs-cluster

This example is meant to be used as a starting template for creating an ECS cluster Service, an application load balancer, a task definition and VPC including all networking resources. The sample container is a simple NodeJS express app that prints hello world on port 3000. The service defines two tasks to run this container. After running this example the web server should be reachable by connecting to the load balancer ip. 

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

aws_access_key_id = "YOUR_ACCESS_KEY_ID"<br/>
aws_secret_access_key = "YOUR_SECRET_ACCESS_KEY"
