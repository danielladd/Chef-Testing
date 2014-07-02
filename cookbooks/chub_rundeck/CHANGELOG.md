chub_rundeck CHANGELOG
======================
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

