name "buyspace_api"
description "role defining buyspace api"
default_attributes "chub-buyspace" => {
    "taskScheduler" => {
      "enabled" => false
    },
    "grails" => {
      "serverURL" => "http://mpqa1-api.commercehub.com",
      "apiServerURL" => "http://mpqa1-api.commercehub.com"
    }
}
run_list "role[base]", "recipe[chub-buyspace::upgrade_buyspace]"