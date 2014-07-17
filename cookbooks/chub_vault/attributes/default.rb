default[:chub_vault][:app_url] = "http://mpbamboo.nexus.commercehub.com/browse/SSO-VAULT/latestSuccessful/artifact/shared/vault-server-shadow.jar/vault-server-shadow.jar"
default[:chub_vault][:ldap][:base_dn] = "dc=vault,dc=commercehub,dc=com"
default[:chub_vault][:ldap][:user_ou] = "ou=users"
default[:chub_vault][:ldap][:read][:cn] = "cn=searchrole"
default[:chub_vault][:ldap][:write][:cn] = "cn=admin"
default[:chub_vault][:ldap][:healthcheck][:username] = "healthcheck"
default[:chub_vault][:ldap][:healthcheck][:valid_password] = "1337Pass"
default[:chub_vault][:ldap][:healthcheck][:invalid_password] = "lamePass"
default[:chub_vault][:ldap][:healthcheck][:guid] = "5311C4E3-228F-4664-8074-1EDEDE24025F"
default[:chub_vault][:java_heap_size] = "1G"
default[:chub_vault][:archaius_config] = {
    "hystrix.threadpool.default.coreSize" => "20"
}
