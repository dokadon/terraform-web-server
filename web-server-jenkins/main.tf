# Provision a web server instance using the latest Ubuntu 19.04 on a
# t2.small node with an AWS Tag naming it "jenkins"

# Create web server
resource "aws_instance" "jenkins" {
  ami = "${data.aws_ami.ubuntu.id}"
  vpc_security_group_ids = ["${aws_security_group.jenkins.id}"]
  instance_type          = "t2.small"
  key_name               = "${var.ssh_key_name}"
  user_data              = "${file("userdata.sh")}"
  tags = {
    Name = "${var.server_name}"
  }

  ebs_block_device {
    device_name = "/dev/sdh"
    volume_size = 10
  }

  # Save the public IP for testing
  provisioner "local-exec" {
    command = "echo ${aws_instance.jenkins.public_ip} > upload/public-ip.txt"
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
