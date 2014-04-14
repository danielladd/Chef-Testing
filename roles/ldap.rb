name "ldap"
description "A node for LDAP service"
run_list "recipe[base]", "recipe[chub_sensu_sso::client]", "recipe[chub_openldap::mirror]"
