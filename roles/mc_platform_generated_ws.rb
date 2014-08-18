name "mc_platform_generated_ws"
description "A linux machine running a Platform Generated Mission Control WS"
run_list "recipe[base]", "recipe[chub_mc_webservice::platform_generated_webservice]"