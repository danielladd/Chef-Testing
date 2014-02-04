name "plaza"
description "A node for the Plaza service"
run_list "recipe[base]", "recipe[chub-sensu::client]", "recipe[chef-kick]", "recipe[chub-plaza]"
