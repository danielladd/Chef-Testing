name "sensu_mailing"
description "role defining the team based email targets for the sensu email handler."
#TODO: Should this live in databag?
default_attributes "chub_sensu" => {
    "email" => {
        "subscriptions_mail_to" => {
            "pipeline_team" => "pipeline@commercehub.com",
            "scm_team" => "mercurial-admin@commercehub.com",
            "platform_team" => "jlazzara@commercehub.com,mmiller@commercehub.com",
            "missioncontrol_team" => "ccucinella@commercehub.com"
        }
    }
}