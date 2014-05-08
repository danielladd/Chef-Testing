name "census"
description "A node for the Census service"
run_list "role[sso]", "recipe[chub_census]"
