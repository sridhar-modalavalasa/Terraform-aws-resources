data "aws_ami" "ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  filter {
        name = "virtualization-type"
        values = ["hvm"]
  }
  filter {
        name   = "architecture"
        values = ["x86_64"]
  }

  owners = ["099720109477"]
}