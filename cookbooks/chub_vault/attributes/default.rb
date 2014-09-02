#default[:chub_vault][:app_url] = "file:///vagrant/vault-shadow.jar"
default[:chub_vault][:app_url] = "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/vault-server/%5BRELEASE%5D/vault-server-%5BRELEASE%5D-shadow.jar"

default[:chub_vault][:ldap][:base_dn] = "dc=vault,dc=commercehub,dc=com"
default[:chub_vault][:ldap][:user_ou] = "ou=users"
default[:chub_vault][:ldap][:read][:cn] = "cn=readrole"
default[:chub_vault][:ldap][:write][:cn] = "cn=writerole"
default[:chub_vault][:ldap][:healthcheck][:username] = "healthcheck"
default[:chub_vault][:ldap][:healthcheck][:valid_password] = "1337Pass"
default[:chub_vault][:ldap][:healthcheck][:guid] = "5311C4E3-228F-4664-8074-1EDEDE24025F"
default[:chub_vault][:java_heap_size] = "1G"
default[:chub_vault][:archaius_config] = {
    "hystrix.threadpool.default.coreSize" => "20"
}
default[:chub_vault][:authentication][:activedirectory][:domain] = "nexus.commercehub.com"
default[:chub_vault][:authentication][:activedirectory][:domain_controller] = "ldap.nexus.commercehub.com"
default[:chub_vault][:authentication][:activedirectory][:required_groups] = []
default[:chub_vault][:authentication][:cache_policy] = "maximumSize=10000,expireAfterWrite=15m"
