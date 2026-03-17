resource "aws_instance" "my-demo_ec2" {
  ami           = "ami-0f5ee92e2d63afc18"   
  instance_type = "t3.micro"               

  tags = {
    Name = "Mydemo-EC2"
  }
}

resource "aws_instance" "my-demo1_ec2" {
  ami           = "ami-0f5ee92e2d63afc18"   
  instance_type = "t3.micro"               

  tags = {
    Name = "Mydemo1-EC2"
  }
}