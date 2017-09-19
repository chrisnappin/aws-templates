# Basic Standalone Web Server

Includes:

* An AMI automatically built using Packer, running a Puppet script to install NGINX
* A CloudFormation template to deploy that AMI as a new EC2 instance in a new VPC

## Building the AMI
* [Packer configuration](nginx-packer-config.json)

This uses the **amazon-ebs** builder, starting from the Amazon Linux AMI, and two provisioners:

*  **shell** - runs the [install_puppet.sh](install_puppet.sh) script to install Puppet
* **puppet-masterless** - installs the nginx module using Puppet (in local mode)
    * [puppet/manifests/site.pp](puppet/manifests/site.pp) - installs the "nginx" puppet module
    * [puppet/modules/nginx/manifests/init.pp](puppet/modules/nginx/manifests/init.pp) - the "nginx" puppet module
    * [puppet/modules/nginx/files/index.html](puppet/modules/nginx/files/index.html) - example static content (installed as /usr/share/ngingx/html/index.html)
  
Run packer as follows:

    packer build nginx-packer-config.json
    
_(make a note of the resulting AMI ID)_   

## Deploy the new EC2 instance

* [template.json](template.json)
* [params.json](params.json)

Template parameters are:

* **tagName** = EC2 instance tag name
* **subnetBlock** = CIDR block for new VPC and subnet
* **amiId** = AMI ID to use for the EC2 instance
* **instanceType** = EC2 instance type (default is `t2.micro`)
* **keyName** = Your EC2 key pair name, used to log into the instance via SSH