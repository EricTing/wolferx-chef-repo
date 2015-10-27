Overview
========

This is the "chef-repo" for building WolferX Development Environment.

How to use
==========

1. boot up CentOS-7 linux machine (or EC2)
2. login with *root* user or running following command with sudo
3. update yum package management tool
	- *CMD:* yum update
4. install chef-client by rpm
	- *CMD:* rpm -ivh https://opscode-omnibus-packages.s3.amazonaws.com/el/7/x86_64/chef-12.5.1-1.el7.x86_64.rpm
5. create chef-client configure file
	- *CMD:* mkdir -p /etc/chef/
	- *CMD:* touch /etc/chef/client.rb
6. insert following config into /etc/chef/client.rb
	- *CMD:* vi /etc/chef/client.rb
	- *Config:*
	'''
	#environment 'production'
	#environment_path '/root/chef-repo/environments'
	#chef_server_url  "https://cfchef/organizations/wolferx"
	#validation_client_name "wolferx-validator"
	#Using default node name (fqdn)
	#trusted_certs_dir "/etc/chef/trusted_certs"
	log_location     STDOUT
	log_level :info
	cookbook_path   "/root/chef-repo/cookbooks"
	role_path '/root/chef-repo/roles'
	data_bag_path  '/root/chef-repo/data_bags'
	encrypted_data_bag_secret '/etc/chef'
	local_mode 'true'
	node_name 'node'
	node_path '/root/chef-repo/nodes'
	'''
7. create RSA key pair for github
	(Following is optional, only no id_rsa && id_rsa.pub file exist in ~/.ssh)
	- *CMD:* mkdir ~/.ssh
	- *CMD:* cd ~/.ssh
	- *CMD:* ls -al
	- *CMD:* ssh-keygen -t rsa -b 4096 -C "wolferiangm@gmail.com"
	- keep enter empty when CL ask you for path & passphrase
	- add id_rsa.pub to github

8. install git & clone chef-repo
	- *CMD:* yum install git
	- *CMD:* git clone https://github.com/chenfanggm/wolfer-chef-repo.git
9. change the name of wolferx-chef-repo to chef-repo
	- *CMD:* mv ~/wolferx-chef-repo ~/chef-repo
10. bootstrap the server by chef-client
	- *CMD:* chef-client

Test
====
1. @Linux get ip address
	- *CMD:* ifconfig
2. @Local add Linux hostname to hosts
	- *CMD:* vi /etc/hosts
	- insert "hostname ip", eg. "wolferx.com 192.168.1.15"
3. @Browser 
	- *url:* http://wolferx.com/wolfx/rest/countries


Congrats!
=========

You should have a running machine with one line deployment enabled.
- *One Line*: chef-client
- *Deploy*: https://github.com/chenfanggm/wolfx.git
