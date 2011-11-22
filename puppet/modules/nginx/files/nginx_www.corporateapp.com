server {
  listen   80 default;
  server_name  localhost;

  access_log  /var/log/nginx/localhost.access.log;
  
  location / {
    proxy_pass   http://127.0.0.1:8080;
  }

}
