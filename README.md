# terraform-web-server
Deploys a simple Apache web server instance in AWS usinig terraform

Setup and prequisites

Clone using https protocol
*  git clone https://github.com/dokadon/terraform-web-server.git

A number pacakes need to exist in your system
You will need sudo access to install them
* terraform
* python
* python-pip
* wget
* unzip
* nodejs

To install the prerequisites excute
* bash install-preqs.sh

Your will need an AWS user account with awscli access priveleges
Export your AWS user crendentials into the env
* export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
* export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>

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
