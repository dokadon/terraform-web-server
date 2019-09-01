#!/usr/bin/env bash

# Check for ssh keys and generate if necessary
if [ -f ~/.ssh/id_rsa.pub ]
then
    echo "Using existing ssh keys"
else
    echo "Making ssh keys to use"
    ssh-keygen
fi

sudo su - <<INSTALL_PREQS
if [ -f /usr/bin/dnf ]
then
    dnf update -y
    dnf install python3 python3-pip wget unzip firefox -y
elif [ -f /usr/bin/apt-get ]
then
    apt-get update -y
    apt-get install python3 python3-pip wget unzip firefox -y
else
    echo "Neither apt-get nor dnf is installed.  You should be using Ubuntu 19.04 or Fedora 30 which uses apt-get or dnf respectively for package installs."
    exit 1
fi

# Download and install if necessary, geckodriver
if [ -f "/usr/local/bin/geckodriver" ]
then
    echo "/usr/local/bin/geckodriver exists"
else
    echo "Installing geckodriver"
    wget -nc https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
    mkdir -p /usr/local/bin
    gunzip geckodriver-v0.24.0-linux64.tar.gz
    tar -xvf geckodriver-v0.24.0-linux64.tar
    mv geckodriver /usr/local/bin
    rm geckodriver-v0.24.0-linux64.tar
fi

# Download and install if necessary, terraform
if [ -f "/usr/local/bin/terraform" ]
then
    echo "/usr/local/bin/terraform exists"
else
    echo "Installing terraform"
    wget -nc https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip
    mkdir -p /usr/local/bin
    unzip terraform_0.12.7_linux_amd64.zip -d /usr/local/bin
fi

pip3 install --upgrade pip
pip3 install awscli
pip3 install -U pytest
pip3 install selenium
pip3 install pytest-selenium
INSTALL_PREQS
