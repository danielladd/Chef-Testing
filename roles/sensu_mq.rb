name "sensu_mq"
description "role defining a sensu mq node, auto clustering should be enabled just apply this and it should join cluster"
run_list *%w[
    recipe[chub_sensu::rabbitmq]
    recipe[chub_log::client]
    role[sensu_mq_logs]
]
default_attributes(
  "sensu" => {
    "init_style" => "runit",
  },
  "rabbitmq" => {
    "cluster" => true,
    "erlang_cookie" => "c00k1e"
  },
)
