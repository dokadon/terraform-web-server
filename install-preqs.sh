#!/usr/bin/env bash


if [ -f /usr/bin/dnf ]
then
    sudo dnf update -y
    sudo dnf install python python-pip wget unzip nodejs -y
else
    echo "dnf is not installed.  You should be using Fedora 25 which uses dnf for package installs."
    exit 1
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
