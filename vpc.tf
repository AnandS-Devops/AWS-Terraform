resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

}

resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet[count.index]
  availability_zone = var.zones[count.index % length(var.zones)]

  tags = {
    Name = "my_public_subnet_${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet[count.index]
  availability_zone = var.zones[count.index % length(var.zones)]

  tags = {
    Name = "my_private_subnet_${count.index + 1}"
  }
}