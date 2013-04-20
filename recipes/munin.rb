include_recipe "munin::client"

# ln -s /etc/passwd /tmp/passwd
# ln -s '/usr/share/munin/plugins/apache_accesses' '/etc/munin/plugins/apache_accesses'
link "#{node['munin']['basedir']}/plugins/apache_accesses" do
  to "#{node['munin']['plugin_dir']}/apache_accesses"
  notifies :restart, resources(:service => "munin-node")
end
# ln -s '/usr/share/munin/plugins/apache_volume' '/etc/munin/plugins/apache_volume'
link "#{node['munin']['basedir']}/plugins/apache_volume" do
  to "#{node['munin']['plugin_dir']}/apache_volume"
  notifies :restart, resources(:service => "munin-node")
end


#template "/etc/apache2/apache2.conf" do
#  source "apache2.conf.erb"
#  owner "root"
#  group "root"
#end

template "#{node['apache']['dir']}/conf.d/serverstatus" do
  source "serverstatus.conf.erb"
  mode 0644
  owner "root"
  group "root"
end


# Implementation of httpresponsetime plugin
# from here http://www.stimuli.com.br/trane/2009/aug/02/munin-plugin-track-http-response-times/

#copy the plugin file itself
cookbook_file "#{node['munin']['plugin_dir']}/httpresponsetime"  do
  source "httpresponsetime"
  mode 0655
  owner "root"
  group "root"
end

# ln -s '/usr/share/munin/plugins/httpresponsetime' '/etc/munin/plugins/httpresponsetime'
link "#{node['munin']['basedir']}/plugins/httpresponsetime" do
  to "#{node['munin']['plugin_dir']}/httpresponsetime"
  notifies :restart, resources(:service => "munin-node")
end

bash "config_munin_node" do
  user "root"
  code <<-EOH
    echo "\n[httpresponsetime]" >> #{node['munin']['basedir']}/plugin-conf.d/munin-node
    echo "env.urls http://localhost/" >> #{node['munin']['basedir']}/plugin-conf.d/munin-node
    munin-node-configure
    #/etc/init.d/munin-node restart
  EOH
  not_if "cat #{node['munin']['basedir']}/plugin-conf.d/munin-node | grep \"httpresponsetime\" "
  notifies :restart, resources(:service => "munin-node")
end
# End section of Implementation of httpresponsetime plugin


# Implementation of munin plugins https://redmine.koumbit.net/projects/munin-contrib/repository/revisions/master/show/plugins/apache
#copy the plugin file itself
cookbook_file "#{node['munin']['plugin_dir']}/apache_activity"  do
  source "apache_activity"
  mode 0655
  owner "root"
  group "root"
end

# ln -s '/usr/share/munin/plugins/apache_activity' '/etc/munin/plugins/apache_activity'
link "#{node['munin']['basedir']}/plugins/apache_activity" do
  to "#{node['munin']['plugin_dir']}/apache_activity"
  notifies :restart, resources(:service => "munin-node")
end

#copy the plugin file itself
cookbook_file "#{node['munin']['plugin_dir']}/apache_average_time_last_n_requests"  do
  source "apache_average_time_last_n_requests"
  mode 0655
  owner "root"
  group "root"
end

# ln -s '/usr/share/munin/plugins/apache_average_time_last_n_requests' '/etc/munin/plugins/apache_average_time_last_n_requests'
link "#{node['munin']['basedir']}/plugins/apache_average_time_last_n_requests" do
  to "#{node['munin']['plugin_dir']}/apache_average_time_last_n_requests"
  notifies :restart, resources(:service => "munin-node")
end

#copy the plugin file itself
cookbook_file "#{node['munin']['plugin_dir']}/apache_request_rate"  do
  source "apache_request_rate"
  mode 0655
  owner "root"
  group "root"
end

# ln -s '/usr/share/munin/plugins/apache_request_rate' '/etc/munin/plugins/apache_request_rate'
link "#{node['munin']['basedir']}/plugins/apache_request_rate" do
  to "#{node['munin']['plugin_dir']}/apache_request_rate"
  notifies :restart, resources(:service => "munin-node")
end

#copy the plugin file itself
cookbook_file "#{node['munin']['plugin_dir']}/apache_smaps"  do
  source "apache_smaps"
  mode 0655
  owner "root"
  group "root"
end

# ln -s '/usr/share/munin/plugins/apache_smaps' '/etc/munin/plugins/apache_smaps'
link "#{node['munin']['basedir']}/plugins/apache_smaps" do
  to "#{node['munin']['plugin_dir']}/apache_smaps"
  notifies :restart, resources(:service => "munin-node")
end

#copy the plugin file itself
cookbook_file "#{node['munin']['plugin_dir']}/apache_users"  do
  source "apache_users"
  mode 0655
  owner "root"
  group "root"
end

# ln -s '/usr/share/munin/plugins/apache_users' '/etc/munin/plugins/apache_users'
link "#{node['munin']['basedir']}/plugins/apache_users" do
  to "#{node['munin']['plugin_dir']}/apache_users"
  notifies :restart, resources(:service => "munin-node")
end

#copy the plugin file itself
cookbook_file "#{node['munin']['plugin_dir']}/apache_watch_"  do
  source "apache_watch_"
  mode 0655
  owner "root"
  group "root"
end

# ln -s '/usr/share/munin/plugins/apache_watch_' '/etc/munin/plugins/apache_watch_'
link "#{node['munin']['basedir']}/plugins/apache_watch_" do
  to "#{node['munin']['plugin_dir']}/apache_watch_"
  notifies :restart, resources(:service => "munin-node")
end

#copy the plugin file itself
cookbook_file "#{node['munin']['plugin_dir']}/eaccelerator"  do
  source "eaccelerator"
  mode 0655
  owner "root"
  group "root"
end

# ln -s '/usr/share/munin/plugins/eaccelerator' '/etc/munin/plugins/eaccelerator'
link "#{node['munin']['basedir']}/plugins/eaccelerator" do
  to "#{node['munin']['plugin_dir']}/eaccelerator"
  notifies :restart, resources(:service => "munin-node")
end


#copy the plugin file itself
cookbook_file "#{node['munin']['plugin_dir']}/php-cgi"  do
  source "php-cgi"
  mode 0655
  owner "root"
  group "root"
end

# ln -s '/usr/share/munin/plugins/php-cgi' '/etc/munin/plugins/php-cgi'
link "#{node['munin']['basedir']}/plugins/php-cgi" do
  to "#{node['munin']['plugin_dir']}/php-cgi"
  notifies :restart, resources(:service => "munin-node")
end

#copy the plugin file itself
cookbook_file "#{node['munin']['plugin_dir']}/php_eaccelerator"  do
  source "php_eaccelerator"
  mode 0655
  owner "root"
  group "root"
end

# ln -s '/usr/share/munin/plugins/php_eaccelerator' '/etc/munin/plugins/php_eaccelerator'
link "#{node['munin']['basedir']}/plugins/php_eaccelerator" do
  to "#{node['munin']['plugin_dir']}/php_eaccelerator"
  notifies :restart, resources(:service => "munin-node")
end


#copy the plugin file itself
cookbook_file "#{node['munin']['plugin_dir']}/php_sessions"  do
  source "php_sessions"
  mode 0655
  owner "root"
  group "root"
end

# ln -s '/usr/share/munin/plugins/php_sessions' '/etc/munin/plugins/php_sessions'
link "#{node['munin']['basedir']}/plugins/php_sessions" do
  to "#{node['munin']['plugin_dir']}/php_sessions"
  notifies :restart, resources(:service => "munin-node")
end

#TODO: print this in chef debug mode
#bash "config_munin_node_1" do
#  user "root"
#  code <<-EOH
#    munin-node-configure
#  EOH
#end

# End section of munin plugins from https://redmine.koumbit.net/projects/munin-contrib/repository/revisions/master/show/plugins/apache
