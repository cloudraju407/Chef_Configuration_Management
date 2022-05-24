#
# Cookbook:: apache2_cookbook
# Recipe:: apache2_recipe
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#Install httpd package
package 'httpd' do
action :install
end
#creats index.html file
cookbook_file '/var/www/html/index.html' do
  source 'index.html'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

#http://13.234.31.118/index.html
#enable and start httpd service
service 'httpd' do
action [:enable, :start]
end

