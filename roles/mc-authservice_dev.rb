name "mc-auth_dev"
description "A linux machine running the MC flavor of CAS (in development)"
run_list "recipe[base]", "recipe[chub_mc_authservice]"
default_attributes "chub_mc_authservice" => {
		"jar_file_url" => "http://bamboom1:8085/browse/MC-AUT/latest/artifact/shared/MC-AuthService-JAR/mc-authservice-1.0-SNAPSHOT-war-exec.jar?os_username=mess&os_password=messuser",
		"keystore_file_url" => "http://bamboom1:8085/browse/MC-AUT/latest/artifact/shared/MC-AuthService-KeyStore/mcauth.jks?os_username=mess&os_password=messuser"
}

