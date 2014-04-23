name "elasticsearch"
description "an elasticsearch cluster node"
run_list "role[base]", "recipe[java]", "recipe[elasticsearch::search_discovery]", "recipe[elasticsearch]"
