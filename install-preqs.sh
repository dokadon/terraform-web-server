#!/usr/bin/env bash

LINUX_VERSION=$(grep ^NAME /etc/*ease | sed 's/NAME=//g')

if [ LINUX_VERSION = 'Fedora' ]
then
    if [ -f /usr/bin/dnf ]
    then
        sudo dnf update
        sudo dnf install python python-pip wget unzip nodejs -y
    else if [ -f /usr/bin/yum ]
        sudo yum update
        sudo yum install python python-pip wget unzip nodejs -y
    else
        echo "You're running a RHEL based OS and do not have yum, or dnf installed"
        exit(1)
    fi
else if [ LINUX_VERSION = 'Ubuntu' ]
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install python python-pip wget unzip nodejs -y
else
    echo "You're running neither a RHEL nor Ubuntu based OS and are therefore not supported"
    exit(1)
fi

# Check for ssh keys and generate if necessary
if [ -f ~/.ssh/id_rsa.pub ]
then
    echo "Using existing ssh keys"
else
    echo "Making ssh keys to use"
    ssh-keygen
fi

# Create /usr/local/bin if necessary
if [ -f "/usr/local/bin/terraform" ]
then
    echo "/usr/local/bin/terraform exists"
else
    echo "Installing terraform"
    wget -nc https://releases.hashicorp.com/terraform/0.8.4/terraform_0.8.4_linux_amd64.zip
    sudo mkdir -p /usr/local/bin
    sudo unzip terraform_0.8.4_linux_amd64.zip -d /usr/local/bin
fi

sudo pip install --upgrade pip
sudo pip install awscli
sudo pip install -U pytest
sudo pip install selenium
sudo pip install pytest-selenium
sudo npm -g install phantomjs-prebuilt
