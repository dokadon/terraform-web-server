#!/bin/bash
apt-get update
apt-get install wget -y
wget https://apt.puppetlabs.com/puppet6-release-bionic.deb
dpkg -i puppet6-release-bionic.deb
apt-get update
apt-get upgrade -y
apt-get install unzip -y
apt-get install puppetserver -y
export PATH=/opt/puppetlabs/bin:$PATH
apt-get install apache2 -y
apt-get install openjdk-8-jdk -y
apt-get install python3 -y
apt-get install python3-pip -y
apt-get install firefox -y
pip3 install selenium
cd /home/ubuntu/upload
bash /home/ubuntu/upload/create-jenkins-disk.sh
/opt/puppetlabs/bin/puppet apply /home/ubuntu/upload/jenkins.pp
/opt/puppetlabs/bin/puppet apply /home/ubuntu/upload/apache.pp
/opt/puppetlabs/bin/puppet apply /home/ubuntu/upload/geckodriver.pp
systemctl restart apache2
