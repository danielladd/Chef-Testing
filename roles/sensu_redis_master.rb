name "sensu_redis_master"
description "role defining a sensu redis master node"
run_list *%w[
    recipe[chub_sensu::redis_master]
    recipe[chub_log::client]
    role[sensu_redis_logs]
    ]
