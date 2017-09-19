# Basic Load Balanced Web Server

A CloudFormation template to deploy the [basic-standalone-webserver](../basic-standalone-webserver/index.md) 
AMI as a set of new EC2 instances in a load balanced auto-scaling group, spread across 3 AZs.

A new VPC is created (spanning all 3 AZs), with a subnet in each AZ. Each of the EC2 instances is behind 
an Elastic Load Balancer (spanning all 3 AZs), using HTTP health-checking every 10 seconds.

The ELB is accessible using the internet (with a DNS name prefixed with the **tagName**), whilst the EC2 instances
are not - they have no public IP and only accept incoming traffic from the ELB.

The auto-scaling group scales up by 1 node if average CPU utilisation is above 50% for 5 minutes
(the free tier monitoring frequency), and down by 1 node if below 20%.

## Building the AMI

Run packer as follows:

    cd ../basic-standalone-webserver
    packer build nginx-packer-config.json
    
_(make a note of the resulting AMI ID)_   

## Deploy the cluster of web servers

* [template.json](template.json)
* [params.json](params.json)

Template parameters are:

* **tagName** = EC2 instances tag name
* **amiId** = AMI ID to use for the EC2 instances
* **instanceType** = EC2 instance type (default is `t2.micro`)
* **keyName** = Your EC2 key pair name, used to log into the instances via SSH
* **vpcBlock** = The CIDR block for the whole VPC
* **subnetBlock1** = The CIDR block for subnet 1, must be within **vpcBlock**
* **subnetBlock2** = The CIDR block for subnet 2, must be within **vpcBlock**
* **subnetBlock3** = The CIDR block for subnet 3, must be within **vpcBlock**

## Injecting Load

* [WebServerTestPlan.jmx](WebServerTestPlan.jmx) - example JMeter test plan

_in practice 5,000 concurrent requests yields a CPU utilisation of about 3%!_