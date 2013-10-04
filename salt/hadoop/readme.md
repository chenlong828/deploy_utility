Automatic deploy hadoop throught saltstack
=========================

0. Preface
------------------------
We have prepare over 4 host to make a hadoop deploy, the deploy process include the following components:

1. The basic set of host, such as hostname, etc.
2. The salt master and minior devops system.
3. Install basic JDK environment.
4. deploy the binary files, such as hadoop(1.2.1), hbase(0.94.10), hive(0.10)
5. Sync the hadoop config file and start the hadoop cluste.
6. Sync the hbase config file and start the hbase cluster

we name the host as follows:

* hadoop-master: the master node, runs namenode, secondarynamenode, jobtracker and HMaster.
* hadoop-slave*: the slave node, runs datanode, tasktracker and RegionServer.

After this process, we will deploy a hadoop cluster with hbase service.

1. Init the base system
-------------------------
At first, we should init the system.

Init the base system by hadoop-init.sh, the useage is:

> init-salt.sh <hostname>

The hadoop-init.sh has predefined the saltstack server and some consts such as hostname from CloudStack, try to modify them.

this script get a lot of assumption, and you may change it for your use.
 
* The salt master host name is saltstack, and its IP address is denoted in the script file.
* There is a hostname patch for cloudstack deploy VMs

After each of the slave/host have been deployed, we should restart these hosts to make the system change get in states.

And then, login to the salt master to connect each salt minior:

> salt-key -L
> salt-key -a hadoop*

2. Deploy the JDK.
-------------------------

use salt to deploy jdk packages to /opt directory:

> salt 'hadoop*' state.sls java

Adjust the environments settings, the environment file is located in the etc/environments file.

> salt 'hadoop*' statel.sls java-env

3. Deploy the hadoop files
-------------------

use salt to deploy the hadoop file as follow:

> salt 'hadoop*' state.sls hadoop-bin

This will taks a few seconds, for these tar package will be transferred to the hosts and process an extract action.

After this process, the /opt directory on the server will appear several sub-directory: hadoop, hbase, hive, jdk, they are both links to the correspond location.

4. Sync the hadoop config file:
---------------------
Use the salt to sync config:

>salt 'hadoop*' state.sls hadoop-cluster

Each of the host have been synchronized, and we can start our hadoop cluster:

> salt 'hadoop-master' cmd.run start-all.sh

the start-all.sh is a script provided by hadoop.

5. Sync the hbase config file:
---------------------
As we have not deployed a zookeeper cluster, we just use the only 1 zookeeper provided by hbase, remember in the production environment, we should provide at least 3-7 zookeeper server in our environment.

> salt 'hadoop*' state.sls hbase-conf

Then we can start our hbase cluster:

> salt 'hadoop-master' cmd.run start-hbase.sh

6. Config the development environment:
---------------------
We reuse the saltstack as our develop and test environment base:

First, we should install maven, assume we deploy maven in /opt/mvn.

Sync the environment file:

> salt 'saltstack' state.sls dev-env