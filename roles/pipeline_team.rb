name "pipeline_team"
description "role for pipeline team machines"
default_attributes(
  "sensu" => {
      "rabbitmq" => {
          "host" => "monmq01.nexus.commercehub.com"
      }
  },
  "chub_pipeline" => {
    "pagerduty" => {
      "api_key" => "0e7c4f5662144f9991def44c23b41146"
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
