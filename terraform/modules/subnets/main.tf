resource "aws_subnet" "subnet" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = var.vpc_id
  availability_zone = "us-west-2b"

  tags = {
    Name = "${var.project_name}-subnet"
  }
}
