resource "aws_instance" "ec2" {
  for_each = var.instance_name
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id
  key_name = "shivam"
   associate_public_ip_address = true

 
 
  tags = {
    Name = each.value.instance_name
  }

  #  lifecycle {
  #   prevent_destroy = true
  # }
}