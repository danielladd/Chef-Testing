name "sensu_server"
description "role defining a sensu server"
#TODO: Should this live in databag?
default_attributes "chub_sensu" => {
    "email" => {
        "recipient" => "noreply@commercehub.com",
        "subscriptions_mail_to" => {
            "pipeline_team" => "pipeline@commercehub.com",
            "scm_team" => "mercurial-admin@commercehub.com",
            "platform_team" => "jlazzara@commercehub.com,mmiller@commercehub.com",
            "missioncontrol_team" => "BLaviolette@commercehub.com,CMcCormick@commercehub.com,CCucinella@commercehub.com,JLane@commercehub.com,LKulzer@commercehub.com,MBreen@commercehub.com,MBouchard@commercehub.com,SVonDuhn@commercehub.com,ZHarvey@commercehub.com",
            "rundeck_mysql_master" => "pipeline@commercehub.com",
            "rundeck_mysql_slave" => "pipeline@commercehub.com"
        }
    }
},
"sensu" => {
    "rabbitmq" => {
        "host" => "mq01"
    },
    "redis" => {
        "host" => "redis01"
    }
},
"uchiwa" => { 
    "api" => [
        { 
        "name" => "Sensu",
        "host" => "sensudev01",
        "ssl" => false,
        "port" => 4567,
        "user" => "",
        "pass" => "",
        "path" => "",
        "timeout" => 5000
        }
    ]
}

override_attributes(
  "ssh_keys" => {
    "lzarou" => "lzarou",
    "wgrunenwald" => "wgrunenwald",
    "kstahl" => "kstahl",
    "bcarr" => "bcarr",
    "dcross" => "dcross"
  }
)
run_list "recipe[chub_sensu::server_distributed]","recipe[chub_sensu::client]"