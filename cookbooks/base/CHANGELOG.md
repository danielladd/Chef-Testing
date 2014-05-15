base CHANGELOG
==============
0.1.16
----
- Larry - Moving ssh-keys recipe into users recipe 

0.1.15
----
- Larry - Adding minions group to all machines by default. 

0.1.14
----
- Larry - Tweaking users recipe to only add users to machine if they are found in ssh_keys has on the node. 

0.1.13
----
- Larry - Adding users.rb recipe

0.1.12
----
- dcarr - Use `apt::default` recipe rather than direct execution of `apt-get update`

0.1.11
-----
- Larry - Added mercurial cookbook as requirement in metadata to support changes to regression_maid.rb recipe 

0.1.8
-----
- dcross - Added windows platform type to base::default to route to windows-specific setup

0.1.3
-----
- Waldo - Adding SmartShipping to the Warning notifications, and removed 
unneeded variables that are passed to the template.

0.1.2
-----
- Waldo - Adding pagerduty_handoff recipe

0.1.1
-----
- Waldo - Adding git and chef-client cookbooks as dependencies


0.1.0
-----
- Waldo - Initial release of base; some basic debian packages

