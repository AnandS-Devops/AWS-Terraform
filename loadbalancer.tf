resource "aws_lb" "my_alb" {
  name               = "my-alb-sg"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.My-lb-sg.id]
  subnets            = aws_subnet.public_subnet[*].id
  tags = {
    Name        = "My demo ALB"
    environment = "Dev"
    project     = "Terraform Demo"
  }
}

resource "aws_lb_target_group" "my_target-group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
  tags = {
    Name        = "My demo Target Group"
    environment = "Dev"
    project     = "Terraform Demo"
  }

}