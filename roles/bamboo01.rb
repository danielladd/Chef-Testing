name "bamboo01"
description "Basic Bamboo Server"
default_attributes({
})
override_attributes({
})
run_list "role[windows_base]", "role[bamboo01_logs]", "recipe[chub_log::client]" 
