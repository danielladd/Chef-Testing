name "bambooM1"
description "Basic Bamboo Server"
default_attributes({
})
override_attributes({
})
run_list "role[windows_base]", "role[bambooM1_logs]", "recipe[chub_log::client]" 
