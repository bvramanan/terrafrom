#vpc
resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"

    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"

    tags =  {
        Name = "${var.vpc_name}"
         }
}


# Subnets
resource "aws_subnet" "subnet1_public" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.public_subnet1_cidr}"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-2a"

    tags = {
        Name = "${var.public_subnet1_name}"
    }
}

resource "aws_subnet" "subnet2_public" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.public_subnet2_cidr}"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-2b"

    tags = {
        Name = "${var.public_subnet2_name}"
           }
}

# Internet GW
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"

    tags = {
        Name = "${var.IGW_name}"
    }
}

# route tables
resource "aws_route_table" "default_route" {
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags = {
        Name = "${var.Main_Routing_Table}"
    }
}


# route associations public
resource "aws_route_table_association" "default_subnet1_public" {
    subnet_id = "${aws_subnet.subnet1_public.id}"
    route_table_id = "${aws_route_table.default_route.id}"
}
resource "aws_route_table_association" "default_subnet2_public" {
    subnet_id = "${aws_subnet.subnet2_public.id}"
    route_table_id = "${aws_route_table.default_route.id}"
}
