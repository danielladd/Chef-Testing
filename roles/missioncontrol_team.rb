name "missioncontrol_team"
description "role for Mission Control team machines"
default_attributes(
  "sensu" => {
      "rabbitmq" => {
          "host" => "sensu01.nexus.commercehub.com"
      }
  }
)
override_attributes(
  "ssh_keys" => {
    "lzarou" => "lzarou",
    "wgrunenwald" => "wgrunenwald",
    "kstahl" => "kstahl",
    "bcarr" => "bcarr",
    "dcross" => "dcross"
  }
)
run_list "recipe[chub_mc_app::sensu_client]"