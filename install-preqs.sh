#!/usr/bin/env bash

#LINUX_VERSION=$(grep ^NAME /etc/*ease | sed 's/NAME=//g')

    if [ -f /usr/bin/dnf ]
    then
        sudo dnf update
        sudo dnf install python python-pip wget unzip npm nodejs nodejs-legacy -y
    elif [ -f /usr/bin/yum ]
    then
        sudo yum update
        sudo yum install python python-pip wget unzip npm nodejs nodejs-legacy -y
    elif [ -f /usr/bin/apt-get ]
    then
        sudo apt-get update -y
        sudo apt-get upgrade -y
        sudo apt-get install python python-pip wget unzip npm nodejs nodejs-legacy -y
    else
        echo "Unsupported Linux version.  Neither yum, dnf or apt-get is installed"
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
