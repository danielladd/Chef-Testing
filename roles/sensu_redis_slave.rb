name "sensu_redis_slave"
description "role defining a sensu redis slave node"
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
run_list "recipe[chub_sensu::redis_slave]"
