name "netsuitews_dev"
description "A linux machine running flight WS (in dev)"
cookbook_versions({
	"chub_mc_webservice" => "= 0.1.0"
})
default_attributes(
    "chub_mc_webservice" => {
   		"jar_file_name" => ".jar",
		"jar_file_url" => "",
		"salesforce_config" => {
			"netsuiteClient" => {
				"host" => 'https://rest.sandbox.netsuite.com',
				"path" => '/app/site/hosting/restlet.nl',
				"script" => '477',
				"deploy" => "1",
				"account" => '365224',
				"email" => '',
				"signature" => '',
				"role" => "1037",
				"maxConnections" => '50',
				"gzipEnabledForRequests" => "false"
			}
		}
	}
)

