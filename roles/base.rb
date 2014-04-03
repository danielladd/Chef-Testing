name "base"
description "A basic role applicable to all nodes"
default_attributes "java" => {
	'install_flavor' => 'oracle',
	'oracle' => { 'accept_oracle_download_terms' => true },
	'jdk_version' => 7
}
run_list "recipe[base]"
