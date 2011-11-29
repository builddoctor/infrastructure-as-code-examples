include_recipe "jetty"

# We do it like this for the example...
cookbook_file "/usr/share/jetty/webapps/app.war" do
  source "app.war"
  mode   "0644"
end

# In real life I'd do something like...
#remote_file "/usr/share/jetty/webapps/app.war" do
#  source node[:jetty][:deploy][:source]
#  checksum node[:jetty][:deploy][:checksum] if node[:jetty][:deploy][:checksum]
#  notifies :restart, "service[jetty]"
#end
