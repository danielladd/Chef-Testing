name "albers_nonprod"
description "A windows machine running Albers (in development)"
run_list "role[albers]", "recipe[chub_windows]", "recipe[chub_albers]"
