chub-klerk Cookbook CHANGELOG
=======================
This file is used to list changes made in each version of the chub-klerk cookbook.

v0.10.4
-------
- Add support for specification of JVM permanent generation size via attribute `java_perm_gen_size`, with a default value of `128m`

v0.10.3
-------
- Update klerk Upstart config. to enable monitoring and management from remote systems via JMX on port 6006
- Replace 127.0.1.1 in /etc/hosts with node's actual permanent IP address

v0.10.2
-------
- Update java cookbook version constraint to 1.19.2

