# cluster
resource "aws_ecs_cluster" "ecs-cluster" {
    name = "${var.ecs_cluster_name}"
}
resource "aws_launch_configuration" "ecs-cluster-launchconfig" {
  name_prefix          = "ecs-launchconfig"
  image_id             = "${var.ECS_AMIS}"
  instance_type        = "${var.ECS_INSTANCE_TYPE}"
  key_name             = "${aws_key_pair.ecskeypair.key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.ecs-ec2-role.id}"
  security_groups      = ["${aws_security_group.ecs-securitygroup.id}"]
  user_data            = "#!/bin/bash\necho 'ECS_CLUSTER=example-cluster' > /etc/ecs/ecs.config\nstart ecs"
  lifecycle              { create_before_destroy = true }
}
resource "aws_autoscaling_group" "ecs-cluster-autoscaling" {
  name                 = "ecs-cluster-autoscaling"
  vpc_zone_identifier  = ["${aws_subnet.subnet1_public.id}", "${aws_subnet.subnet2_public.id}"]
  launch_configuration = "${aws_launch_configuration.ecs-cluster-launchconfig.name}"
  min_size             = 1
  max_size             = 1
  tag  {
      key = "Name"
      value = "ecs-ec2-container"
      propagate_at_launch = true
  }
}
