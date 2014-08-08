name "bamboo"
description "Basic Bamboo Server"
default_attributes({
})
override_attributes({
})
run_list "role[windows_base]", "role[windows_java]"
