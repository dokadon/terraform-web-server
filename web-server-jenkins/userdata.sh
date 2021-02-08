#!/bin/bash

/usr/sbin/parted /dev/xvdh mklabel msdos
/usr/sbin/parted /dev/xvdh mkpart primary ext4 0% 100%
/sbin/mkfs.ext4 /dev/xvdh1
/bin/mkdir /var/lib/jenkins
echo "/dev/xvdh1 /var/lib/jenkins ext4 defaults 1 1" >> /etc/fstab
sleep 60
/bin/mount /var/lib/jenkins

apt-get update
apt-get install wget -y
/usr/bin/wget https://apt.puppetlabs.com/puppet7-release-focal.deb
/usr/bin/dpkg -i /puppet7-release-focal.deb
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

/opt/puppetlabs/bin/puppet apply /home/ubuntu/upload/jenkins.pp
/opt/puppetlabs/bin/puppet apply /home/ubuntu/upload/apache.pp
/opt/puppetlabs/bin/puppet apply /home/ubuntu/upload/geckodriver.pp
systemctl restart apache2
