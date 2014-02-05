name "census"
run_list "recipe[chub-sensu::client]", "recipe[chub-census::default]"
