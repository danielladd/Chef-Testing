name "windows_java"
description "A windows machine running java"
run_list "recipe[windows]", "recipe[java]"
