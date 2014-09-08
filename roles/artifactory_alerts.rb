name "artifactory_alerts"
description "role for artifactory machines to define admin users and alerts"
default_attributes(
  "sensu" => {
    "init_style" => "runit",  
    "keepalive" => {
       "thresholds" => {
         "warning" => 300,
         "critical" => 1200
     }
    },
    "rabbitmq" => {
       "host" => "monmq.nexus.commercehub.com"
    }
  }
)
override_attributes(
  "ssh_keys" => {
    "bcarr" => "bcarr",
    "bduclos" => "bduclos",
    "cmccormick" => "cmccormick",
    "cparker" => "cparker",
    "doverfield" => "doverfield",
    "dcarr" => "dcarr",
    "estegmann" => "estegmann",
    "ghila" => "ghila",
    "hgrunenwald" => "hgrunenwald",
    "jdipierro" => "jdipierro",
    "jlazzara" => "jlazzara",
    "lzarou" => "lzarou",
    "mmason" => "mmason",
    "mmiller" => "mmiller",
    "pcullen" => "pcullen",
    "root" => ["bcarr","bduclos","cmccormick","cparker","doverfield","dcarr","estegmann","ghila","hgrunenwald","jdipierro","jlazzara","lzarou","mmason","mmiller","pcullen","sgiminiani","tkostell"],
    "sgiminiani" => "sgiminiani",
    "tkostell" => "tkostell"
  }
)
run_list "recipe[chub_artifactory::sensu_client]","recipe[base::users]"

