# Building the web server infrastructure

After setting up your devops env and exporting your AWS user credentials to the environment you should:

``Edit **terraform.tfvars** and set your correct IP address so that you and only you can ssh into the ec2 instance``

Next, build the web server from within the web-server directory by:

``terraform init``

``terraform apply``

**Access your web server instance at the public IP displayed in the console output.**

**Give the instance at least 5 minutes to start AFTER the script has finished**

# Running the tests

Run the tests from within the web-server directory

``pytest --driver Firefox``

# SSH into your EC2 instance

You can ssh into the EC2 instance using:

``ssh -i $HOME/.ssh/id_rsa ubuntu@THE_PUBLIC_IP_DISPLAYED_IN_THE_CONSOLE``

# Removing the web server infrastructure

When you are ready to remove your infrastructure execute from inside the web-server directory

``terraform destroy``
