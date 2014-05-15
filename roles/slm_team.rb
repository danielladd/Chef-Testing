name "slm_team"
description "role for SLM team machines"
override_attributes(
  "ssh_keys" => {
    "jdipierro" => "jdipierro"
  }
)
run_list "recipe[base::users]","ssh-keys"