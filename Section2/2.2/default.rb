#
# Cookbook Name:: chef-webserver
# Recipe:: default

package 'apache2'

service 'apache2' do
  action [:enable, :start]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end
