name "plaza"
run_list "recipe[chub-sensu::client]", "recipe[chub-plaza::default]"
