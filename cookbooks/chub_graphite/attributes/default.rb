#default[:chub_graphite][:]
default[:graphite][:web][:ldap][:SERVER] = 'nexus.commercehub.com'
default[:graphite][:web][:ldap][:BASE_USER] = 'CN=service-graphite,OU=graphite,OU=applications,DC=nexus,DC=commercehub,DC=com'
default[:graphite][:web][:ldap][:BASE_PASS] = 'CH$rvGr@p'
default[:graphite][:web][:ldap][:USER_QUERY] = '(sAMAccountName=%s)'
default[:graphite][:web][:ldap][:SEARCH_BASE] = 'OU=staff,DC=nexus,DC=commercehub,DC=com'