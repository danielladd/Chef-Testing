name "flightws"
description "A linux machine running the Flight WS "
run_list "recipe[base]", "recipe[chub_mc_webservice::flight_webservice]"