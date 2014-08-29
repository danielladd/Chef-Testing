name "steward_dev"
description "A windows machine running the Steward service for CSDash (dev)"
run_list "role[dev]", "recipe[chub_windows]", "recipe[chub_log::client]", "recipe[windows::reboot_handler]"
