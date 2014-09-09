name "platformws"
description "A linux machine running the Platform WS "
run_list "recipe[base]", "recipe[chub_mc_webservice::platform_webservice]", "recipe[chub_mc_logs]"