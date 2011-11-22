name "appserver"
description "Corporate App Server"
run_list "recipe[corporateapp]", "recipe[nginx::loadbalancer]"

override_attributes(
    "nginx" => {
        "loadbalancer" => {
            "name" => "corporateapp",
            "source" => "http://localhost:8080"
        }
    }    
)

