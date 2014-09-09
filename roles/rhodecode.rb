name "rhodecode"
description "role for scm machines"
run_list *%w[
    recipe[chub_scm::sensu_client]
    ]

default_attributes(
  "sensu" => {
      "init_style" => "runit",
      "rabbitmq" => {
          "host" => "monmq.nexus.commercehub.com"
      }
  }
)
