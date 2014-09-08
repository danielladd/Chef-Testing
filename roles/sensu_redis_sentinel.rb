name "sensu_redis_sentinel"
description "role defining a sensu redis sentinel node to watch over redis cluster"
run_list *%w[
    recipe[chub_sensu::redis_sentinel]
    recipe[chub_log::client]
    role[sensu_redis_logs]
    ]
default_attributes(
  "sensu" => {
    "init_style" => "runit"
  },
  "redisio" => {
    "sentinel" => {
        "manage_config" => false
    }
  }
)
