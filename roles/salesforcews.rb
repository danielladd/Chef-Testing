name "salesforcews"
description "A linux machine running salesforce web service"
run_list "recipe[base]", "recipe[chub_mc_webservice::salesforce_webservice]"
