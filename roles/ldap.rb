name "ldap"
description "A node for LDAP service"
run_list "recipe[base]", "recipe[chub-sensu::client]", "recipe[chub-openldap::mirror]"
