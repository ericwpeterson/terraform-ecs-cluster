resource "aws_ecs_service" "test-ecs-service" {
  	name            = "test-ecs-service"
  	iam_role        = "${aws_iam_role.ecs-service-role.name}"
  	cluster         = "${aws_ecs_cluster.test-ecs-cluster.id}"
  	task_definition = "${aws_ecs_task_definition.wordpress.family}:${max("${aws_ecs_task_definition.wordpress.revision}", "${data.aws_ecs_task_definition.wordpress.revision}")}"
  	desired_count   = 1
    depends_on = ["null_resource.alb_exists"]

  	load_balancer {
    	target_group_arn  = "${aws_alb_target_group.ecs-target-group.arn}"
    	container_port    = 3000
    	container_name    = "wordpress"
	}
}

resource "null_resource" "alb_exists" {
  triggers {
    alb_name = "${aws_alb.ecs-load-balancer.arn}"
  }
}
