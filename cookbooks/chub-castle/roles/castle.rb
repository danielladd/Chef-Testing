name "castle"
run_list "recipe[chub_sensu_sso::client]", "recipe[chub-castle::default]"
