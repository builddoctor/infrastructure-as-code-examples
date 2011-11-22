include_recipe "jetty"
include_recipe "nginx"

cookbook_file "/usr/share/jetty/webapps/app.war" do
    source "app.war"
    mode   "0644"
end

