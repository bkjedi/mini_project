#
# Cookbook Name:: apache2
# Recipe:: default
#

yum_package "httpd" do
  action :install
end

service "httpd" do
  supports :restart => true
  action [ :enable, :start ]
end

template "/etc/httpd/conf/httpd.conf" do
  source "httpd.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[httpd]"
  action :create
end
