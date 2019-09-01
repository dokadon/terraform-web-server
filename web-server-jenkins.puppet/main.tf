# Provision a web server instance using the latest Ubuntu 16.04 on a
# t2.micro node with an AWS Tag naming it "web-server"
provider "aws" {
    region = "us-east-2"
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

  provisioner "file" {
    source = "jenkins.pp"
    destination = "/home/ubuntu/jenkins.pp"
  }
    
  provisioner "remote-exec" {
    inline = [
      "sudo wget https://apt.puppetlabs.com/puppet6-release-bionic.deb",
      "sudo dpkg -i puppet6-release-bionic.deb",
      "sudo apt-get update",
      "sudo apt-get install apache2 -y",
      "sudo systemctl enable apache2",
      "sudo systemctl start apache2",
      "sudo apt-get install puppet -y",
      "sudo chmod 777 /var/www/html/index.html",
      "sudo apt-get install openjdk-11-jdk -y",
      "sudo puppet apply /home/ubuntu/jenkins.pp"
    ]
  }       
    
  provisioner "file" {
    source = "index.html"
    destination = "/var/www/html/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo chmod 644 /var/www/html/index.html"
    ]
  }    

  # Save the public IP for testing
  provisioner "local-exec" {
    command = "echo ${aws_instance.web_server.public_ip} > public-ip.txt"
  }
}
