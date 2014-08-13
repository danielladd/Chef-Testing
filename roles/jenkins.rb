name "jenkins"
description "Basic Jenkins Server"
default_attributes({
})
override_attributes({
})
run_list "role[windows_base]", "role[jenkins_logs]", "recipe[chub_log::client]" 
