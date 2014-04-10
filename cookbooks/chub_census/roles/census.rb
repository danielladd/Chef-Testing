name "census"
run_list "recipe[chub_sensu_sso::client]", "recipe[chub_census::default]"
