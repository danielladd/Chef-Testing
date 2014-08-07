name "sensu_redis_slave"
description "role defining a sensu redis slave node"
default_attributes("sensu" => {
  'redis' => {
      'port' => '6379'
  }
})
run_list "recipe[chub_sensu::redis_slave]"