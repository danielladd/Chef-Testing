name "sensu_mq"
description "role defining a sensu mq node, auto clustering should be enabled just apply this and it should join cluster"
default_attributes( "rabbitmq" => {
    "cluster" => true,
    "erlang_cookie" => "c00k1e"
}
)
run_list "recipe[chub_sensu::rabbitmq]"