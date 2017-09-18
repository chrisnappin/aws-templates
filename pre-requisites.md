# Pre-requisites

Before being able to run these templates, you will need to:

* Open an AWS account (the free tier is a great starting point)
* Using the IAM section in the AWS web console, create a new user with sufficient permissions to run the templates, and download their access key (ID and secret key)
* Download, install and add to the `PATH` the following locally:
    * AWS CLI - [Download](http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-msi-on-windows)
    * Packer v0.11.0 - [Download](https://www.packer.io/downloads.html)
* Run `aws configure` (passing the IAM user key details) to setup access
* Create and download a key pair
* (if using putty) convert your key pair from `.pem` to `.ppk` using `puttygen`