name "census"
description "A node for the Census service"
run_list "recipe[base]", "recipe[chub-sensu::client]", "recipe[chef-kick]", "recipe[chub-census]"
