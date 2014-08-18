name "oddrest"
description "role for oddrest machines"
run_list *%w[
	recipe[chub_oddrest::default]
    recipe[chub_oddrest::sensu_client]
]
default_attributes(
  "sensu" => {
      "rabbitmq" => {
          "host" => "monmq01.nexus.commercehub.com"
      }
  }
)
