name "vault"
description "A node for the Vault service"
run_list "recipe[base]", "recipe[chub-sensu::client]", "recipe[chef-kick]", "recipe[chub-vault]"
