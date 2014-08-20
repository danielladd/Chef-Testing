name "mailcatcher"
description "role to deploy a mailcatcher instance"
run_list *%w[
    recipe[mailcatcher::default]
    ]

default_attributes "mailcatcher" => {
    "smtp-ip" => "0.0.0.0"
    "http-ip" => "0.0.0.0"
}
