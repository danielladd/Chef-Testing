name "vault"
description "A node for the Vault service"
run_list "role[base]", "recipe[chub_sensu_sso::client]", "recipe[chub_vault]"
