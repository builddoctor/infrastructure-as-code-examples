include_recipe "nginx::default"

template "/etc/nginx/sites-available/#{node[:nginx][:loadbalancer][:name]}" do
    source "lb.erb"
    mode   "0644"
    notifies :restart, resources(:service => "nginx")
end

link "/etc/nginx/sites-enabled/default" do
  action :delete
  only_if do
    File.exists?("/etc/nginx/sites-enabled/default")
  end
end

link "/etc/nginx/sites-enabled/#{node[:nginx][:loadbalancer][:name]}" do
    to "/etc/nginx/sites-available/#{node[:nginx][:loadbalancer][:name]}"
end
