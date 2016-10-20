#Basic Standalone Server

A single EC2 server instance, located in a new VPC (with gateway and internet routing) and subnet, with a public IP.

The instance has a security group that only allows incoming SSH traffic, no other incoming traffic.

* [basic-standalone-server.json](basic-standalone-server.json)
* [params.json](params.json)

Template parameters are:

* **tagName** = EC2 instance tag name
* **subnetBlock** = CIDR block for new VPC and subnet
* **amiId** = AMI ID to use for the EC2 instance
* **instanceType** = EC2 instance type (default is `t2.micro`)
* **keyName** = Your EC2 key pair name, used to log into the instance via SSH
