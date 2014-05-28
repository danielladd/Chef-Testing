include_recipe "sudo"

sudo "rundeck-ssh" do
    user        "rundeck-ssh"
    runas       "hornetq"
    nopasswd    true
    commands    ["/etc/init.d/hornetq", "/bin/rm"]
end