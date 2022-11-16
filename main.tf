resource "aws_vpc" "MyFirstVpc" {
    cidr_block = var.cidr_block[0]
    tags = {
        Name = "Project VPC"
    }
}

resource "aws_subnet" "MyPublicsubnet1" {
    vpc_id = aws_vpc.MyFirstVpc.id
    cidr_block = var.cidr_block[1]
    tags = {
        Name = "MyPublicSubnet1"
    }
}
resource "aws_subnet" "MyPrivatesubnet1" {
    vpc_id = aws_vpc.MyFirstVpc.id
    cidr_block = var.cidr_block[2]
    tags = {
        Name = "MyPrivateSubnet1"
    }
}


resource "aws_internet_gateway" "MyIgw" {
    vpc_id = aws_vpc.MyFirstVpc.id
    tags = {
        Name = "MyIgw"
    }
}

resource "aws_security_group" "MySecurityGroup" {
  name        = "security group using Terraform"
  description = "security group using Terraform"
  vpc_id      = aws_vpc.MyFirstVpc.id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Allow Traffic"
  }
}

resource "aws_route_table" "MyRouteTable" {
    vpc_id = aws_vpc.MyFirstVpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.MyIgw.id
    }
    tags = {
        Name = "MyRouteTable"
    }
}

resource "aws_route_table_association" "MyAssociation" {
    subnet_id = aws_subnet.MyPublicsubnet1.id
    route_table_id = aws_route_table.MyRouteTable.id
}

resource "aws_instance" "web"{
  ami           = "ami-026b57f3c383c2eec"
  instance_type = var.instance_type
  subnet_id = aws_subnet.MyPublicsubnet1.id
  tags = {
    Name = "Terraform Ec2"
  }
}
