chub_rundeck CHANGELOG
======================
0.1.19
-----
- Larry - using chef search in place of hard coded master/slave

0.1.18
-----
- Larry - mysql_backup.rb recipe created, some small cookbook cleanup

0.1.17
-----
- Larry - adding sensu alerting for rundeck server itself

0.1.16
-----
- Larry - adding sensu alerting for the mysql master/slave

0.1.15
-----
- Larry - Cleaning up cookbook a bit more, adding rundeck, proxy, hostname to default attributes to abstract out of role

0.1.14
-----
- Larry - Adding an api account

0.1.13
-----
- Larry - Fix of bug in mysql slave using root password for repl account

0.1.12
-----
- Larry - More cookbook refactoring, pulling shared components out into mysql_base

0.1.11
-----
- Larry - Cookbook cleanup, generalizing, moving hardcoded values to attributes where necessary

0.1.10
-----
- Larry - Moving rundeck to a mysql database, h2 wasn't doing the job anymore.

0.1.9
-----
- Larry - Setup rundeck to run on port 80

0.1.8
-----
- Larry - Updates to web.xml and ldap config to add PSEAdmin group and remove non-used groups

0.1.7
-----
- Larry - Adding krb5.conf kerberos config as a cookbook_file deployed to /etc/krb5.conf

0.1.6
-----
- Larry - Update resources.xml template to account for windows machines

0.1.5
-----
- Larry - Install of rundeck-winrm plugin on server recipe.

0.1.4
-----
- Larry - adding SG_OrderStream_Batch_Admins to rundeck access

0.1.3
-----
- Larry - Attempting to solve problem of server restarting every chef run

0.1.2
-----
- Larry - Adding admin.aclpolicy and web.xml to cookbook files to be copied out and override defaults for our custom setup

0.1.1
-----
- Larry - Adding resource.xml creation based on project definitions

0.1.0
-----
- Larry - Initial release of chub_rundeck

