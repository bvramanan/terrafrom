
resource "aws_cognito_user_pool" "test-pool" {
  name = "${var.congnito_name}"
}
