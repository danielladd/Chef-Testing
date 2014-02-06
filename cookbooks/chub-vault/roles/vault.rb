name "vault"
run_list "recipe[chub-sensu::client]", "recipe[chub-vault::default]"
