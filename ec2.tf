resource "aws_instance" "my-demo_ec2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet[0].id
  vpc_security_group_ids = [aws_security_group.my_demo_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.my_instance_profile.name

  lifecycle {
    ignore_changes = all
  }

  tags = {
    Name = "Mydemo-EC2"
  }
}

resource "aws_instance" "my-demo1_ec2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_subnet[0].id
  vpc_security_group_ids = [aws_security_group.my_demo_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.my_instance_profile.name

  lifecycle {
    ignore_changes = all
  }

  tags = {
    Name = "Mydemo1-EC2"
  }
}