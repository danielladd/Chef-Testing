name "pathfinder_dev"
description "A windows machine running Pathfinder (in development)"
run_list "role[pathfinder]", "recipe[chub_windows]"
