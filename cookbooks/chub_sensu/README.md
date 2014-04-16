# chub_sensu cookbook

A cookbook for installing sensu and confirguring shared handlers.  This cookbook was designed with the intention to be wrapped by team or application specific resources.

This cookbook uses Chef searches, so you can't fully test it with Vagrant and Chef Solo.

To test with [Test Kitchen](http://kitchen.ci/), run `kitchen test all`.  
But think about doing this because I haven't written any tests

# Requirements

# Usage
Chub_Sensu is a cookbook designed with the intention to be wrapped.  An example of a cookbook which wraps this cookbook and leverages the recipes is chub_pipeline.  The cookbook contains a client and server recipe.  Both are to be used respectively to define a client and a server.  A client requires use of the sensu_client resource and then needs each plugin that will be run downloaded and placed in the default[:chub_sensu][:root_plugin_path] directory. 

Proper usage of the chub_sensu cookbook is to wrap the chub_sensu::server.rb and chub_sensu::client.rb into your team/product based server recipe.  A working example of this is chub_pipeline::sensu_server.rb and chub_pipeline::sensu_client.rb respectively.  

## Sensu Community Plugins
Sensu has a great community and you may be able to find a handlers or checks to accomplish what you already need to do.  We have the sensu community plugins repository on github mirrored on our gitlab server.  You can find this at the address below.

(https://git.nexus.commercehub.com/mirrors/sensu-community-plugins)

### Defining a client
THe LWRP for defining a client is below.  You will use this in your sensu_client.rb recipe.  This will define the name of the machine being monitored along with its ip address and any subscriptions.  Subscriptions are used to assign checks to a client.  When using this in your sensu_client.rb recipe you will want to add a subscription specific to your team or application.  It is also possible to rely on a nodes role to accomplish this as well.

```ruby
sensu_client node.name do
    address node[:ipaddress]
    subscriptions node[:roles] + ["pipeline_team"]
end
```

### Downloading Plugins to a Client
The default client recipe in the chub_sensu cookbook will download the check-disk, check-cpu, check-ram, check-proc plugins from the community repo.  These plugins are included and added to every machine as there is a common use for them across all machines.

```ruby
remote_file "#{node[:chub_sensu][:root_plugin_path]}/check-disk.rb" do
    source "#{node[:chub_sensu][:root_sensu_community_plugins_repo_url]}/plugins/system/check-disk.rb"
    mode 0755
end
```

### Define a handler
A handler is used to take action when a check is triggered.  There is a shared handler for email.  More information about this email can be found below.  

Due to using a shared sensu server we have developed a practice of namespacing our handlers.  The example below defines the 'pagerduty_pipeline' handler.  

```ruby
sensu_handler "pagerduty_pipeline" do
    type "pipe"
    command "/usr/bin/rub1.y9.3 #{node[:chub_sensu][:root_handler_path]}/pagerduty.rb"
end
```

### Email Handler
The handler name is 'email'.  This handler will email the appropriate party based on the clients subscription.  To leverage this handler, you just need to add the 'email' handler to your checks.  Defining your email group by description can be done using attributes.  We have a handy role to define this that gets applied to the sensu server. An example of a team definition is listed below.  The example defines the 'pipeline_team' subscriptions email address.  This means any clients which subscribe to pipeline_Team, when a check is triggered that uses the email handler the emails will be directed to the address listed for pipeline_team.  This definition lives in the sensu_mailing.rb role.  Add a new key => value pair for your product or teams based emails.  The key should match the subscription name.  The value can be a comma seperated list of email addresses.

```ruby
"chub_sensu" => {
    "email" => {
        "subscriptions_mail_to" => {
            "pipeline_team" => "pipeline@commercehub.com",
        }
    }
}
```

### Define a check
A check is script that runs against a machine and returns data back to sensu based on the outcome of the script.  Checks are defined at the server level.  A check will require a handler and and at least one subscriber.  The handler will take action when the check is triggered and subscribers are used to allow clients to subscribe to that check.  

Due to using a shared sensu server we have developed a practice of namespacing our checks.  The example below defines the pipeline check for cpu.  The check below will check cpu every 60 seconds.  It will alert when 2 or more occurences are detected in a row.  The check will throw a critical warning at 90% cpu usage, this is defined by -c 90.  Likewise, it will throw a warning at 70% cpu, defined by -w 70.  

```ruby
sensu_check "pipeline_check_cpu" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-cpu.rb -c 90 -w 70"
    handlers ["pipeline_team"]
    subscribers ["pipeline_team"]
    interval 60
    additional(:occurrences => 2)
end
```

# Attributes

# Recipes

# Author

Author:: Larry Zarou (lzarou@commercehub.com)

