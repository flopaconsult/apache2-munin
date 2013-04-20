include_recipe "apache2-munin::munin"

#changes the default Magento .htaccess file to enable access to server-status
cookbook_file "/var/www/.htaccess"  do
  source ".htaccess"
  mode 0655
  owner "root"
  group "root"
end



