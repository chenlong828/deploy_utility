Automatic deploy hadoop throught saltstack
=========================

1. Init the base system
-------------------------
Init the base system by hadoop-init.sh, the useage is:

hadoop-init.sh <hostname>

The hadoop-init.sh has predefined the saltstack server and some consts such as hostname from CloudStack, try to modify them.

2. Deploy the JDK
-------------------------

use salt to deploy jdk packages to /opt directory:

> salt 'hadoop*' state.sls java

And then use cmd.run to automatic install the jdk

> salt 'hadoop*' cmd.run "./jdk-6u34-linux-x64.bin << echo -e '\n'" runas="root" pwd="/opt"

Adjust the environments settings, the environment file is located in the etc/environments file.

> salt 'hadoop*' statel.sls java-env