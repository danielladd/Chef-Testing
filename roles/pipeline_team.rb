name "pipeline_team"
description "role for pipeline team machines"
default_attributes "sensu" => {
    "rabbitmq" => {
        "host" => "sensu01.nexus.commercehub.com"
    }
},
"ssh_keys" => {
        "lzarou" => "lzarou",
        "wgrunenwald" => "wgrunenwald"
}
run_list "recipe[chub_pipeline::sensu_client]"