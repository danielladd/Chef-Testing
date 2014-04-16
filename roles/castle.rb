name "castle"
description "A node for the Castle service"
run_list "role[base]", "recipe[chub_sensu_sso::client]", "recipe[chub_castle]"
