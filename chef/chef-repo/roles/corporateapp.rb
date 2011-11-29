name "corporateapp"
description "Corporate App Server"
run_list(
  "recipe[jetty]", 
  "recipe[jetty::deploy]", 
  "recipe[nginx::loadbalancer]"
)

override_attributes(
    "nginx" => {
        "loadbalancer" => {
            "name" => "corporateapp",
            "source" => "http://localhost:8080"
        }
    },    
    "jetty" => {
        "deploy" => {
            "source" => "http://build-repository/build-number/app.war"
        }
    }    
)

