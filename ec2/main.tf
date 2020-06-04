provider "aws" {
access_key = "${var.AWS_ACCESS_KEY}"
secret_key = "${var.AWS_SECRET_KEY}"
region = "${var.AWS_REGION}"
}

resource "aws_instance" "web" {
ami = "${var.ami}"
instance_type = "${var.instance_type}"

tags = {
Name = "ubuntu"
}

}
output "ip" {
 value = "${aws_instance.web.public_ip}"
}

output "public_dns" {
 value = "${aws_instance.web.public_dns}"
}
