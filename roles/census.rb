name "census"
description "A node for the Census service"
run_list "role[base]", "recipe[chub_sensu_sso::client]", "recipe[chub_census]"
