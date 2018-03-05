data "aws_ecs_task_definition" "helloworld" {
  task_definition = "${aws_ecs_task_definition.helloworld.family}"
}

resource "aws_ecs_task_definition" "helloworld" {
    family                = "hello_world"
    container_definitions = <<DEFINITION
[
  {
    "name": "helloworld",
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
