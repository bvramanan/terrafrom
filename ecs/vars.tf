variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {}
variable "PATH_TO_PRIVATE_KEY" {
  default = "ecskeypair"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "ecskeypair.pub"
}
variable "ECS_INSTANCE_TYPE" {}
variable "ECS_AMIS" {}

variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable "public_subnet1_cidr" {}
variable "public_subnet2_cidr" {}


variable "public_subnet1_name" {}
variable "public_subnet2_name" {}


variable "Main_Routing_Table" {}
variable "ecr_repo_name" {}
variable "ecs_cluster_name" {}

