name "castle"
run_list "recipe[chub-sensu::client]", "recipe[chub-castle::default]"
