name "vault"
description "A node for the Vault service"
run_list "role[sso]", "recipe[chub_vault]"
