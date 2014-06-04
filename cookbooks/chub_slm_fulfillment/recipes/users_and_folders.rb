service_name    = "slm_message_processor"
project_name    = "slm_fulfillment"
group_name      = project_name
user_name       = project_name

group group_name do
    action :create
    system true
    append true
end

user user_name do
    comment "Application user for the SLM Fulfillment Components"
    gid group_name
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group group_name do
    action :modify
    append true
    members [user_name, "chadmin"]
end

[
    {
        dir:    "/opt/#{project_name}",
        mode:   0550
    },{
        dir:    "/etc/#{project_name}",
        owner:  "root",
        mode:   0755
    },{
        dir:    "/var/#{project_name}",
        mode:   0770
    },{
        dir:    "/var/log/#{project_name}",
        mode:   0770
    }
].each do |data|
    directory data[:dir] do
        owner data[:owner] || user_name
        group data[:group] || group_name
        mode data[:mode]
    end
end