name "sensu_server"
description "role defining a sensu server"
run_list *%w[
    recipe[chub_sensu::server_distributed]
    recipe[chub_sensu::client]
    recipe[chub_log::client]
    role[sensu_rules]
    role[sensu_logs]
    role[pipeline_team]
]

#TODO: Should this live in databag?
default_attributes "sensu" => {
    "init_style" => "runit",
    "rabbitmq" => {
        "host" => "monmq.nexus.commercehub.com"
    },
    "redis" => {
        "host" => "monredis.nexus.commercehub.com"
    },
    "api" => {
        "host" => "monapp.nexus.commercehub.com"
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
    "version" => "0.2.1-1",
    "settings" => {
        "user" => "",
        "pass" => ""
    },
    "api" => [
        {
        "name" => "Sensu",
        "host" => "monapp.nexus.commercehub.com",
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
