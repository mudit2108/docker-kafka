#
# Cookbook Name:: kafka
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory '/home/kafka' do
  action :create
end

user 'kafka' do
  comment 'Kafka user'
  home '/home/kafka'
  shell '/bin/bash'
  gid 'sudo'
  password 'kafka123'
end

# apt_update 'Update the apt cache daily' do
#   frequency 86_400
#   action :periodic
# end

# package "default-jre"

# package "zookeeperd"

directory '/home/kafka/kafka' do
  owner 'kafka'
  mode '777'
  action :create
end

remote_file '/home/kafka/kafka/kafka.tgz' do
  source 'http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz'
  owner 'kafka'
  mode '777'
  action :create
end

bash 'extracting tar' do
  cwd '/home/kafka/kafka/'
  code <<-EOH
  tar -xvzf /home/kafka/kafka/kafka.tgz --strip 1
  EOH
end

template '/home/kafka/kafka/config/server.properties' do
  source 'server.properties.erb'
  mode '777'
end

bash 'start kafka' do
  user 'kafka'
  cwd '/home/kafka/kafka/'
  code <<-EOH
    nohup /home/kafka/kafka/bin/kafka-server-start.sh /home/kafka/kafka/config/server.properties > /home/kafka/kafka/kafka.log 2>&1 &
    EOH
end
