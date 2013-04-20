template "htpasswd" do
  path "#{node[:apache][:dir]}/.htpasswd"
  source "image-server/htpasswd"
  owner "root"
  group "root"
  mode 0644
end
template "envvars" do
  path "#{node[:apache][:dir]}/envvars"
  source "image-server/envvars"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "apache2")
end
template "apache2.conf" do
  path "#{node[:apache][:dir]}/apache2.conf"
  source "image-server/apache2.conf"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "apache2")
end
template "htaccess" do
  path "/mnt/ftp/shared/.htaccess"
  source "image-server/htaccess"
  owner "root"
  group "root"
  mode 0644
end

