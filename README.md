# terraform-web-server
Deploys a simple Apache web server instance on Ubuntu 18.04 in AWS using terraform.

One command initializes the terraform environment.
``terraform init``

One command builds the infrastructure.
``terraform apply``

One command tears down the infrastructure.
``terraform destroy``

One command runs the tests
``pytest --driver Firefox``

One command handles installing the required build environment
``bash install-preqs.sh``


# Setup and prerequisites

There are a number of dev ops tools which are required in the build environment.

## Linux Version, dnf, apt-get, git, bash & sudo
* Verified to work on Fedora 28 or greater and on Ubuntu 18.04 or greater.

* dnf(Fedora) or apt-get(Ubuntu) and git must already be installed.

* sudo or root access is required

* bash shell access is required

## Clone from within a bash shell using https protocol

``git clone https://github.com/dokadon/terraform-web-server.git``

## install-preqs.sh
* Your build system should be up to date with the latest packages installed.  The included install script installs the following tools if they do not already exist.
* terraform
* python3
* python3-pip
* wget
* unzip
* firefox
* geckodriver

## To install the prerequisites execute

``bash install-preqs.sh``

# AWS user account required
An AWS user account with awscli access priveleges is needed
You can get one here https://aws.amazon.com

Export your AWS user credentials into the env before building the web server infrastructure using:

``export AWS_ACCESS_KEY_ID=[AWS_ACCESS_KEY_ID]``

``export AWS_SECRET_ACCESS_KEY=[AWS_SECRET_ACCESS_KEY]``

# Building the web server infrastructure

After setting up your devops env and exporting your AWS user credentials to the environment build the web server from within the web-server directory by:

``cd web-server``

``terraform init``

``terraform apply``

# Running the tests

The test framework uses
* pytest
* selenium
* firefox
* geckodriver

To run the tests from within the web-server directory execute

``pytest --driver Firefox``


# Removing the web server infrastructure

When you are ready to remove your infrastructure execute from inside the web-server directory

``terraform destroy``

# Building the web server infrastructure with a Jenkins instance in it

To build the web server with a Jenkins instance in it:

``cd web-server-jenkins``

Then read the README.md file and follow its instructions
