# terraform-web-server-jenkins
Adds to the web server example, by deploying a Jenkins instance on the web server.

# Building the Jenkins instance

After setting up your devops env and exporting your AWS user credentials to the environment you can build the web server with a Jenkins instance in it by:

``cd web-server-jenkins``

Edit the ``vars.tf`` and change ``example.com`` to your actual domain.  Also, replace the other values for the other variables with your speciific values.

``cd upload``

Edit these files also and replace ``example.com`` with your actual domain.  Also rename ``jenkins.example.com.conf`` to ``jenkins.[YOUR_DOMAIN].conf``

``cd ../``

``terraform init``

``terraform apply``

# Removing the infrastructure

When you are ready to remove your infrastructure execute from inside the web-server directory

``terraform destroy``
