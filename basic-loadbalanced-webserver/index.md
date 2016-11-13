#Basic Load Balanced Web Server

Includes:

* A CloudFormation template to deploy the [basic-standalone-webserver](../basic-standalone-webserver) AMI as a set of new EC2 instances in an auto-scaling group, located in the default VPC of 2 AZs.
(TODO: behind an ELB)

##Building the AMI

Run packer as follows:

    cd ../basic-standalone-webserver
    packer build nginx-packer-config.json
    
_(make a note of the resulting AMI ID)_   

##Deploy the new EC2 instance

* [template.json](template.json)
* [params.json](params.json)

Template parameters are:

* **amiId** = AMI ID to use for the EC2 instances
* **instanceType** = EC2 instance types (default is `t2.micro`)
* **keyName** = Your EC2 key pair name, used to log into the instances via SSH