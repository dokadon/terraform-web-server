# Deploy ssh key for instance access
resource "aws_key_pair" "deployer" {
  key_name   = "web_server"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
