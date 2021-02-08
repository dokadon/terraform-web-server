variable "region" {
  default = "us-east-2"
}
variable "server_name" {
  default = "jenkins9"
}
variable "domain_name" {
  default = "YOUR_DOMAIN."
}
variable "ssh_key_name" {
  default = "jenkins9"
}
variable "ami" {
  default = "ubuntu/images/hvm-ssd/ubuntu-*-19.04-amd64-server-*"
}
variable "device_name" {
  description = "Jenkins data device name"
  default = ""
}
variable "your_ip" {
  default = "your_ip_address"
}
