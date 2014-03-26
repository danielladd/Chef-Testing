name "plaza"
run_list "recipe[chub_sensu_sso::client]", "recipe[chub-plaza::default]"
