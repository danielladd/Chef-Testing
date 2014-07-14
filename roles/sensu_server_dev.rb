name "sensu_server_dev"
description "role defining a sensu server in the development environment."
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
run_list "recipe[chub_sensu::server]","recipe[chub_sensu::client]","recipe[chub_pipeline::sensu_server]","recipe[chub_pipeline::sensu_client]","recipe[base::users]","recipe[sensu-admin]","recipe[chub_mc_app::sensu_server]","recipe[chub_scm::sensu_server]","recipe[chub_albers::sensu_server]","recipe[chub_rundeck::sensu_server]"