name "vault"
run_list "recipe[chub_sensu_sso::client]", "recipe[chub_vault::default]"