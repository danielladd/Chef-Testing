name "sensu_server"
description "role defining a sensu server"
run_list *%w[
    recipe[chub_sensu::server_distributed]
    recipe[chub_sensu::client]
    recipe[chub_log::client]
    role[sensu_rules]
    role[sensu_logs]
    role[pipeline_team]
]
