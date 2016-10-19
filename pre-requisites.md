#Pre-requisites

Before being able to run Cloudformation templates, you will need to:

* Open an AWS account (the free tier is a great starting point)
* Using the IAM section in the AWS web console, create a new user with sufficient permissions to run the templates, and download their access key (ID and secret key)
* Install the AWS CLI
* Run `aws configure` (passing the IAM user key details) to setup access
* Create and download a key pair
* (if using putty) convert your key pair from `.pem` to `.ppk` using `puttygen`