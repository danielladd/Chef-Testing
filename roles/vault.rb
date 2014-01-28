name "vault"
description "A node for the Vault service"
run_list "recipe[base]", "recipe[chef-kick]", "recipe[chub-vault]"
