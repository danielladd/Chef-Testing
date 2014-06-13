name "mc-authservice_dev"
description "A linux machine running the MC flavor of CAS (in development)"
run_list "recipe[base]", "recipe[tomcat]", "recipe[chub_mc_logs]", "recipe[chub_mc_authservice]"
default_attributes "chub_mc_authservice" => {
		"war_file_url" => "http://bamboom1:8085/browse/MC-AUT/latest/artifact/shared/MC-AuthService-WAR/authservice.war?os_username=mess&os_password=messuser",
		"keystore_file_url" => "http://bamboom1:8085/browse/MC-AUT/latest/artifact/shared/MC-AuthService-KeyStore/mcauth.jks?os_username=mess&os_password=messuser",
		"log4j_xml_url" => "http://bamboom1:8085/browse/MC-AUT/latest/artifact/shared/MC-DEV-Log4j-Config/log4j-dev.xml?os_username=mess&os_password=messuser",
		"cas_properties_file_url" => "http://bamboom1:8085/browse/MC-AUT/latest/artifact/shared/MC-AuthService-CAS-Properties/cas.properties?os_username=mess&os_password=messuser",
		"keystore_file" => "mcauth.jks"
},
"tomcat" => {
	"base_version" => "7"

},
"chub_mc_logs" => {
	"mc_resource" => "authservice",
	"log_server" => "lsdev.nexus.commercehub.com", 
	"logs_on" => false
}
