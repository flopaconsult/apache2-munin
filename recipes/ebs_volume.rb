#
# Cookbook Name:: apache2
# Recipe:: ebs_volume
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "aws"
include_recipe "xfs"

gem_package "right_aws"  do
  action :install
end

aws_ebs_volume "apache_archive_data_volume" do
  provider "aws_ebs_volume"
  aws_access_key node[:runa][:aws_access_key]
  aws_secret_access_key node[:runa][:aws_secret_access_key]
  availability_zone node[:ec2][:placement_availability_zone]
  device node[:runa][:device]
  size node[:runa][:ebs_vol_size]
  action [:create, :attach]
end

directory node[:runa][:ec2_path] do
  action :create
  recursive true
  mode 0755
  owner "root"
  group "root"
end

execute "mkfs.xfs"  do
  command "mkfs.xfs #{node[:runa][:device]}"
  action :run
  not_if "cat /proc/mounts | grep #{node[:runa][:device]}"
end

mount node[:runa][:ec2_path] do
  device "#{node[:runa][:device]}"
  options "rw noatime"
  fstype "xfs"
  action [ :enable, :mount ]
  # Do not execute if its already mounted
  not_if "cat /proc/mounts | grep #{node[:runa][:ec2_path]}"
end

directory "#{node[:runa][:ec2_path]}/archive" do
  action :create
  recursive true
  mode 0755
  owner "root"
  group "root"
end

