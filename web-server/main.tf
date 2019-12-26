# Provision a web server instance using Ubuntu on a
# t2.micro node with an AWS Tag naming it "web-server"

# Create web server
resource "aws_instance" "web_server" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  vpc_security_group_ids = ["${aws_security_group.web_server.id}"]
  instance_type          = "t2.micro"
  key_name               = "${var.ssh_key_name}"
  user_data              = "${file("userdata.sh")}"
  tags = {
    Name = "${var.server_name}"
  }

  # Save the public IP for testing
  provisioner "local-exec" {
    command = "echo ${aws_instance.web_server.public_ip} > public-ip.txt"
  }

  connection {
    user        = "ubuntu"
    host        = "${self.public_ip}"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "upload"
    destination = "/home/ubuntu"
  }
}
