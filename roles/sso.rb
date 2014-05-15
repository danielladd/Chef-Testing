name "sso"
description "Base role for all SSO machines"
override_attributes(
  "ssh_keys" => {
    "dcarr" => "dcarr",
    "dcross" => "dcross",
    "kstahl" => "kstahl",
    "ktitus" => "ktitus"
  }
)
run_list "role[base]", "recipe[base::users]", "recipe[chub_sensu_sso::client]"
