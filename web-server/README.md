# Building the web server infrastructure

After setting up your devops env and exporting your AWS user credentials to the environment build the web server from within the web-server directory by:

Edit the ``vars.tf`` and change ``example.com`` to your actual domain.  Also, replace the other values for the other variables with your speciific values.

``terraform init``

``terraform apply``

# Running the tests

Run the tests from within the web-server directory

``pytest --driver Firefox``

# Removing the web server infrastructure

When you are ready to remove your infrastructure execute from inside the web-server directory

``terraform destroy``
