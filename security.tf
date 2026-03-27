resource "aws_security_group" "my_demo_sg" {
  name        = "my_demo_sg"
  vpc_id      = aws_vpc.my_vpc.id
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 24
    to_port     = 24
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "My demo Security Group"
  }
}

resource "aws_security_group" "My-lb-sg" {
  name        = "my-lb-sg"
  vpc_id      = aws_vpc.my_vpc.id
  description = "Allow HTTP traffic to LB"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "My demo Load Balancer Security Group"
    environment = "Dev"
    project     = "Terraform Demo"
  }
}