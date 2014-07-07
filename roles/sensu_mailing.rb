name "sensu_mailing"
description "role defining the team based email targets for the sensu email handler."
#TODO: Should this live in databag?
default_attributes "chub_sensu" => {
    "email" => {
        "subscriptions_mail_to" => {
            "pipeline_team" => "pipeline@commercehub.com",
            "scm_team" => "mercurial-admin@commercehub.com",
            "platform_team" => "jlazzara@commercehub.com,mmiller@commercehub.com",
            "missioncontrol_team" => "BLaviolette@commercehub.com,CMcCormick@commercehub.com,CCucinella@commercehub.com,JLane@commercehub.com,LKulzer@commercehub.com,MBreen@commercehub.com,MBouchard@commercehub.com,SVonDuhn@commercehub.com,ZHarvey@commercehub.com"
        }
    }
}