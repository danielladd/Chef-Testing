name "plaza"
description "A node for the Plaza service"
run_list "recipe[base]", "recipe[chef-kick]", "recipe[chub-plaza]"
