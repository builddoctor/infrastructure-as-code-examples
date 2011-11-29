require_recipe "apt"

package "jetty" do
    action :install
end

service "jetty" do
    action [:enable]
end

file "/etc/default/jetty" do
    mode "0644"
    content "NO_START=0\nVERBOSE=yes\n"
    notifies :restart, resources(:service => "jetty")
end
