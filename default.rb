# Cookbook Name: Apache2 
#Recipe:: default
#
#
#Stelligent Mini Project

execute "apt-get update" do
        command "apt-get update"
end

package "httpd" do 
        action : install
end

execute "rm -rf /var/www"
link "/var/www" do 
        to "/vagrant"
end

sevice 'httpd' do 
        action [:enable, :start]
end

cookbook_file "/vargrant/www/index.html" do
        source "index.html"
        mode "0644"
end
