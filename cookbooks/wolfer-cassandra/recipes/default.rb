#
# Cookbook Name:: wolfer-cassandra
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "/tmp/apache-cassandra.tar.gz" do
   source "http://www.apache.org/dyn/closer.lua/cassandra/3.0.0/apache-cassandra-3.0.0-rc2-bin.tar.gz"
   notifies :run, 'execute[untar cassandra]', :immediately
end

execute 'untar cassandra' do
  command 'tar -xzvf /tmp/apache-cassandra.tar.gz -C /tmp/apache-cassandra'
  action :nothing
  notifies :run, 'execute[move cassandra to opt dir]', :immediately  
end

execute 'move cassandra to opt dir' do
  command 'mv /tmp/apache-cassandra -C /opt/apache-cassandra'
  action :nothing
end


