name "albers_nonprod"
description "A windows machine running Albers (in QA)"
run_list "role[albers]", "recipe[chub_windows]", "recipe[chub_albers]", "recipe[chub_log::client]", "recipe[windows::reboot_handler]"
