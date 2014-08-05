name "missioncontrol_app"
description "A linux machine running a Mission Control Application"
run_list "recipe[base]", "recipe[chub_mc_app]", "recipe[chub_mc_logs]"