name "buyspace_wapp_canary"
description "role defining buyspace wapp canary node"
default_attributes "chub-buyspace" => {
	"security" => {
		"shiro" => {
			"realm" => "sso"
		}
	}
}
run_list "role[buyspace_wapp]", "recipe[chub-buyspace::upgrade_buyspace]"