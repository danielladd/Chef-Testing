name "plaza"
description "A node for the Plaza service"
run_list "role[base]", "recipe[chub_sensu_sso::client]", "recipe[chub_plaza]"
