# Provision a web server instance using the latest Ubuntu 16.04 on a
# t2.micro node with an AWS Tag naming it "web-server"
provider "aws" {
    region = "us-east-2"
}

# Deploy ssh key for instance access
resource "aws_key_pair" "deployer" {
  key_name = "web_server" 
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

# Create web server
resource "aws_instance" "web_server" {
    ami = "${data.aws_ami.ubuntu.id}"
    vpc_security_group_ids = ["${aws_security_group.web_server.id}"]
    instance_type = "t2.micro"
    key_name      = "web_server"
    tags = {
        Name = "web-server"
    }

  connection {
    user         = "ubuntu"
    host         = "${self.public_ip}"
    private_key  = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install apache2 -y",
      "sudo systemctl enable apache2",
      "sudo systemctl start apache2",
      "sudo chmod 777 /var/www/html/index.html"
    ]
  }

  provisioner "file" {
    source = "index.html"
    destination = "/var/www/html/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 644 /var/www/html/index.html"
    ]
  }

  # Save the public IP for testing
  provisioner "local-exec" {
    command = "echo ${aws_instance.web_server.public_ip} > public-ip.txt"
  }

}
