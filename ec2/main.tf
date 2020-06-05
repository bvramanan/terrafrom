provider "aws" {
}

resource "aws_instance" "web" {
ami = "${var.ami}"
instance_type = "${var.instance_type}"

tags = {
Name = "${var.name}"
}

}
output "ip" {
 value = "${aws_instance.web.public_ip}"
}

output "public_dns" {
 value = "${aws_instance.web.public_dns}"
}
