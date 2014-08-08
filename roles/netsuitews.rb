name "netsuitews"
description "A linux machine running the Flight WS "
run_list "recipe[base]", "recipe[chub_mc_webservice::netsuite_webservice]"