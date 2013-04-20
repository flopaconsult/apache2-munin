#
# Cookbook Name:: apache2
# Recipe:: logrotate
#


template "apache2" do
  path "/etc/logrotate.d/apache2"
  source "logrotate-apache2.erb"
  owner "root"
  group "root"
  mode 0644
end


