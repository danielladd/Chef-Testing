name "mc_platform_team"
description "role for Mission Control Platform team machines"
default_attributes(
  "sensu" => {
      "rabbitmq" => {
          "host" => "sensu01.nexus.commercehub.com"
      }
  }
)
run_list "recipe[chub_mc_app::sensu_client]"