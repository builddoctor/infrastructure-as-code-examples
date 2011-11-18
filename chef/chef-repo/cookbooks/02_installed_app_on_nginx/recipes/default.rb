package "nginx" do
  action :install
end

file "/var/www/nginx-default/index.html" do
  owner "root"
  group "root"
  mode  "0644"
  content "\nThis page, courtesy of Chef\n"
end

service "nginx" do
  action [:enable, :start]
end
