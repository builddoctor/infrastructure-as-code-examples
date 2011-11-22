include_recipe "jetty"
include_recipe "nginx"

cookbook_file "/usr/share/jetty/webapps/app.war" do
    source "app.war"
    mode   "0644"
end

link "/etc/nginx/sites-enabled/default" do
    action :delete
    only_if do
        File.exists?("/etc/nginx/sites-enabled/default")
    end
    notifies :restart, "service[nginx]"
end

