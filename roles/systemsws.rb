name "systemsws"
description "A linux machine running Systems WS"
run_list "recipe[base]", "recipe[chub_mc_webservice::systems_webservice]"