#!/usr/bin/env bash

# update O/S packages
sudo yum update -y

# install Puppet v3.x
sudo yum install -y puppet3

# create packer staging directories with write permissions for ec2-user
# to work around issue 5347 in Packer 1.1.0...
sudo mkdir /tmp/packer-puppet-masterless
sudo mkdir /tmp/packer-puppet-masterless/module-0
sudo mkdir /tmp/packer-puppet-masterless/manifests
sudo chown -R ec2-user:ec2-user /tmp/packer-puppet-masterless
sudo chmod -R 775 /tmp/packer-puppet-masterless
