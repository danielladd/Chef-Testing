name "albers_dev"
description "A windows machine running Albers (in development)"
run_list "role[albers]", "recipe[chub_windows]", "recipe[chub_albers]", "recipe[chub_logsearch_shipper]"
