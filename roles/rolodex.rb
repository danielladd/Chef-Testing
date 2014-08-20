name "rolodex"
description "role for rolodex machines"
run_list *%w[
	recipe[chub_rolodex::default]
    recipe[chub_rolodex::sensu_client]
]
default_attributes(
  "sensu" => {
      "rabbitmq" => {
          "host" => "monmq01.nexus.commercehub.com"
      }
  }
)
