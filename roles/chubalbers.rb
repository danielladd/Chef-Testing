name "chubalbers"
description "A windows machine running Albers"
run_list "recipe[chub_windows]", "recipe[chub_albers]"
