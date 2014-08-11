name "sensu_server"
description "role defining a sensu server"
run_list *%w[
    recipe[chub_sensu::server_distributed]
    recipe[chub_sensu::client]
    role[sensu_rules]
    role[pipeline_team]
]

#TODO: Should this live in databag?
default_attributes "sensu" => {
    "rabbitmq" => {
        "host" => "monmq01"
    },
    "redis" => {
        "host" => "monredis01"
    },
    "api" => {
        "host" => "monapp01"
    }
}

override_attributes(
  "ssh_keys" => {
    "lzarou" => "lzarou",
    "wgrunenwald" => "wgrunenwald",
    "kstahl" => "kstahl",
    "bcarr" => "bcarr",
    "dcross" => "dcross"
  },
  "uchiwa" => { 
    "api" => [
        { 
        "name" => "Sensu",
        "host" => "monapp01",
        "ssl" => false,
        "port" => 4567,
        "user" => "",
        "pass" => "",
        "path" => "",
        "timeout" => 5000
        }
    ]
}
)