#!/usr/bin/env bash


if [ -f /usr/bin/dnf ]
then
    sudo dnf update -y
    sudo dnf install python3 python3-pip wget unzip nodejs -y
else
    echo "dnf is not installed.  You should be using Fedora 30 which uses dnf for package installs."
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
    wget -nc https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip
    sudo mkdir -p /usr/local/bin
    sudo unzip terraform_0.12.7_linux_amd64.zip -d /usr/local/bin
fi

sudo pip3 install --upgrade pip
sudo pip3 install awscli
sudo pip3 install -U pytest
sudo pip3 install selenium
sudo pip3 install pytest-selenium
