name "connmanws"
description "A linux machine running connman WS"
run_list "recipe[base]", "recipe[chub_mc_webservice::connman_webservice]"