name "castle"
description "A node for the Castle service"
run_list "role[sso]", "recipe[chub_castle]"
