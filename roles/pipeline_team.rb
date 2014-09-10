name "pipeline_team"
description "role for pipeline team machines"
default_attributes(
  "sensu" => {
      "init_style" => "runit",
      "rabbitmq" => {
          "host" => "monmq.nexus.commercehub.com"
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
run_list "recipe[chub_pipeline::sensu_client]","recipe[base::users]"
