# terraform-web-server
Deploys a simple Apache web server instance in AWS using terraform

One command builds the infrastructure.
* terraform apply
One command tears down the infrastructure.
* terraform destroy
One command runs the tests
* pytest --driver PhantomJS

However, there are a number of dev ops tools which need to installed first.

Setup and prerequisites

Clone using https protocol
*  git clone https://github.com/dokadon/terraform-web-server.git

A number packages need to exist in your system
Your build system should be up to date with the latest packages installed
You will need sudo access to install them
* terraform
* python
* python-pip
* wget
* unzip
* nodejs

To install the prerequisites execute
* bash install-preqs.sh

An AWS user account with awscli access priveleges is needed
You can get one here https://aws.amazon.com

Export your AWS user crendentials into the env using
* export AWS_ACCESS_KEY_ID=<<AWS_ACCESS_KEY_ID>>
* export AWS_SECRET_ACCESS_KEY=<<AWS_SECRET_ACCESS_KEY>>


After you have set up your dev ops env

To build the server
* cd web-server
* terraform apply

The test framework uses
* pytest
* Selenium
* PhantomJS

To run the tests from within the web-server directory execute
* pytest --driver PhantomJS

When you are ready to remove your infrastructure execute
* terraform destroy
