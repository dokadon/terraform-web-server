#!/usr/bin/env bash

wget -nc https://releases.hashicorp.com/terraform/0.8.4/terraform_0.8.4_linux_amd64.zip

# Check for ssh keys and generate if necessary
if [ -r ~/.ssh/id_rsa.pub ]
then
    echo "Using existing ssh keys"
else
    echo "Making ssh keys to use"
    ssh-keygen
fi

# Create /usr/local/bin if necessary
if [ -r "/usr/local/bin/terraform" ]
then
    echo "/usr/local/bin/terraform exists"
else
    echo "Installing terraform"
    mkdir -p /usr/local/bin
    unzip terraform_0.8.4_linux_amd64.zip -d /usr/local/bin
fi

pip install -U pytest
pip install selenium
pip install pytest-selenium
pip install nodejs
npm -g install phantomjs-prebuilt
