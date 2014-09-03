name "sensu_rules"
description "wrapper role used to include rules on sensu server"
run_list *%w[
    recipe[chub_pipeline::sensu_server]
    recipe[chub_rundeck::sensu_server]
    recipe[chub_apartment::sensu_server]
    recipe[chub_oddrest::sensu_server]
    recipe[chub_rolodex::sensu_server]
    recipe[chub_mc_app::sensu_server]
]

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
            "rundeck_mysql_slave" => "pipeline@commercehub.com",
            "apartment" => "rolodex@commercehub.com",
            "oddrest" => "rolodex@commercehub.com",
            "rolodex" => "rolodex@commercehub.com"
        }
    }
},
"apartment" => {
    "pagerduty" => {
        "api_key" => "726a0e6e51c045faaf74c5ab8b3e2628"
    },
    "graphite" => {
        "host" => "stats02.nexus.commercehub.com",
        "port" => 2003
    }
},
"oddrest" => {
    "pagerduty" => {
        "api_key" => "726a0e6e51c045faaf74c5ab8b3e2628"
    },
    "graphite" => {
        "host" => "stats02.nexus.commercehub.com",
        "port" => 2003
    }
},
"rolodex" => {
    "pagerduty" => {
        "api_key" => "726a0e6e51c045faaf74c5ab8b3e2628"
    },
    "graphite" => {
        "host" => "stats02.nexus.commercehub.com",
        "port" => 2003
    }
}
