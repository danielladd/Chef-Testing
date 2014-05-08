name "ldap"
description "A node for LDAP service"
run_list "role[sso]", "recipe[chub_openldap::mirror]"
