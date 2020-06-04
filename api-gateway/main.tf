resource "aws_api_gateway_rest_api" "DemoAPI" {
  name        = "${var.api_gateway_name}"
  description = "This is my API for testing"
}
