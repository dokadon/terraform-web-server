#!/usr/bin/env bash


if [ -f /usr/bin/dnf ]
then
    sudo dnf update -y
    sudo dnf install python3 python3-pip wget unzip firefox -y
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

# Download and install if necessary, geckodriver
if [ -f "/usr/local/bin/geckodriver" ]
then
    echo "/usr/local/bin/geckodriver exists"
else
    echo "Installing geckodriver"
    wget -nc https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
    sudo mkdir -p /usr/local/bin
    sudo gunzip geckodriver-v0.24.0-linux64.tar.gz
    sudo tar -xvf geckodriver-v0.24.0-linux64.tar
    sudo mv geckodriver /usr/local/bin
    sudo rm geckodriver-v0.24.0-linux64.tar
fi

# Download and install if necessary, terraform
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
