name "sensu_redis_slave"
description "role defining a sensu redis slave node"
run_list *%w[
    recipe[chub_sensu::redis_slave]
    recipe[chub_log::client]
    role[sensu_redis_logs]
    ]
default_attributes("redisio" => {
    "sentinel" => {
        "manage_config" => false
    }
},
"sensu" => {
  "init_style" => "runit",
  'redis' => {
      'port' => '6379'
  }
})
