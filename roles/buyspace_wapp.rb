name "buyspace_wapp"
description "role defining buyspace web app node"
override_attributes "chub-buyspace" => {
    "taskScheduler" => {
      "enabled" => false
    }, 
    "grails" => {
      "serverURL" => "https://mpqa1-buyspace.commercehub.com",
      "apiServerURL" => "http://mpqa1-api.commercehub.com"
    }   
}
run_list "role[base]", "recipe[chub-buyspace::upgrade_buyspace]"