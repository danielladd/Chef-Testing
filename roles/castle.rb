name "castle"
description "A node for the Castle service"
run_list "recipe[base]", "recipe[chub-sensu::client]", "recipe[chef-kick]", "recipe[chub-castle]"
