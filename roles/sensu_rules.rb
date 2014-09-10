name "sensu_rules"
description "wrapper role used to include rules on sensu server"
run_list *%w[
    recipe[chub_pipeline::sensu_server]
    recipe[chub_rundeck::sensu_server]
    recipe[chub_apartment::sensu_server]
    recipe[chub_oddrest::sensu_server]
    recipe[chub_rolodex::sensu_server]
    recipe[chub_mc_app::sensu_server]
    recipe[chub_artifactory::sensu_server]
    recipe[chub_scm::sensu_server]
]
