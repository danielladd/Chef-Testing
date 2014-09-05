name "missioncontrol_team"
description "role for Mission Control team machines"
default_attributes(
  "sensu" => {
  	  "init_style" => "runit",
      "rabbitmq" => {
          "host" => "monmq.nexus.commercehub.com"
      }
  }
)
run_list "recipe[chub_mc_app::sensu_client]"