resource "aws_key_pair" "ecskeypair" {
  key_name = "ecskeypair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
  lifecycle {
    ignore_changes = ["public_key"]
  }
}
