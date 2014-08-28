name "sensu_redis_master"
description "role defining a sensu redis master node"
default_attributes("redisio" => {
    "sentinel" => {
        "manage_config" => false
    }
},
"sensu" => {
  'redis' => {
      'port' => '6379'
  }
})
run_list "recipe[chub_sensu::redis_master]"
