resource "aws_ecs_service" "test-ecs-service" {
  	name            = "test-ecs-service"
  	iam_role        = "${aws_iam_role.ecs-service-role.name}"
  	cluster         = "${aws_ecs_cluster.test-ecs-cluster.id}"
  	task_definition = "${aws_ecs_task_definition.helloworld.family}:${max("${aws_ecs_task_definition.helloworld.revision}", "${data.aws_ecs_task_definition.helloworld.revision}")}"
  	desired_count   = 2
    depends_on = ["null_resource.alb_exists"]

  	load_balancer {
    	target_group_arn  = "${aws_alb_target_group.ecs-target-group.arn}"
    	container_port    = 3000
    	container_name    = "helloworld"
	}
}

resource "null_resource" "alb_exists" {
  triggers {
    alb_name = "${aws_alb.ecs-load-balancer.arn}"
  }
}
