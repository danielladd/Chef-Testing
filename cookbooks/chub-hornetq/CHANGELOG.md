chub-hornetq CHANGELOG
======================
0.2.7
_____

* Larry - Adding rundeck-ssh user to hornetq group

0.2.6
_____

* Larry - Using proper attributes to have sudo not squash all sudo access

0.2.5
_____

* Larry - Added sudo cookbook as dependency.

0.2.4
_____

* Larry - Adding rundeck_sudoers file to add a sudoers file allowing rundeck-ssh user to assume hornetq for starting/stopping purposes. 

0.2.3
_____

* Larry - Getting download URLs from file in staging dir for hq and mq destinations.  Will fall back to attributes if file not found

0.2.2
_____

* Larry - Hub_deployment now uses a touchfile's presence to decide if it should carry out deployment

0.2.1
_____

* Larry - Adding new property for platform deployment

0.2.0
_____

* Changing dependency from 'java' cookbook to 'chub_java'

0.1.3
-----

* Fixing issue preventing idempotency with hub.rb deploy block

0.1.2
-----

* Fixing issue with sym linked log directory

0.1.1
-----

* Updates to add hornetq hub deployments

0.1.0
-----
- [your_name] - Initial release of chub-hornetq

- - -
