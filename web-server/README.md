# Building the web server infrastructure

After setting up your devops env and exporting your AWS user credentials to the environment build the web server from within the web-server directory by:

``terraform init``

``terraform apply``

**Access your web server instance at the public IP displayed in the console output.**

**Give the instance at least 5 minutes to start AFTER the script has finished**

# Running the tests

Run the tests from within the web-server directory

``pytest --driver Firefox``

# Removing the web server infrastructure

When you are ready to remove your infrastructure execute from inside the web-server directory

``terraform destroy``
