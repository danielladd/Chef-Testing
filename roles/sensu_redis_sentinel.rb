name "sensu_redis_sentinel"
description "role defining a sensu redis sentinel node to watch over redis cluster"
default_attributes("redisio" => {
    "sentinel" => {
        "manage_config" => false
    }
})
run_list "recipe[chub_sensu::redis_sentinel]"
