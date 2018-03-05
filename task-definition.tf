data "aws_ecs_task_definition" "wordpress" {
  task_definition = "${aws_ecs_task_definition.wordpress.family}"
}

resource "aws_ecs_task_definition" "wordpress" {
    family                = "hello_world"
    container_definitions = <<DEFINITION
[
  {
    "name": "wordpress",
    "image": "eric1123/docker-nodejs-demo",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3000
      }
    ],
    "memory": 256,
    "cpu": 1
  }
]
DEFINITION
}
