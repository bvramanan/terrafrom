
provider "aws" {
access_key = "${var.AWS_ACCESS_KEY}"
secret_key = "${var.AWS_SECRET_KEY}"
region = "${var.AWS_REGION}"
}



resource "aws_s3_bucket" "default" {
  bucket = "${var.s3_bucket_name}"
  acl    = "private"


}

output "bucket_arn" {
  value = "${aws_s3_bucket.default.arn}"
}
