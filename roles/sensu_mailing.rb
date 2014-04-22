name "sensu_mailing"
description "role defining the team based email targets for the sensu email handler."
#TODO: Should this live in databag?
default_attributes "chub_sensu" => {
    "email" => {
        "subscriptions_mail_to" => {
            "pipeline_team" => "lzarou@commercehub.com",
            "scm_team" => "auribe@commercehub.com",
        }
    }
}