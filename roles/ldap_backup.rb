name "ldap_backup"
description "A node for LDAP service backup"
run_list "role[sso]", "recipe[chub_openldap::slave]"
