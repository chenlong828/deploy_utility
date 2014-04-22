#!/bin/bash

ssh hadoop-master hadoop-daemon.sh start namenode
ssh hadoop-master hadoop-daemon.sh start secondarynamenode
ssh hadoop-master hadoop-daemon.sh start jobtracker
ssh hadoop-slave1 hadoop-daemon.sh start datanode
ssh hadoop-slave1 hadoop-daemon.sh start tasktracker
ssh hadoop-slave2 hadoop-daemon.sh start datanode
ssh hadoop-slave2 hadoop-daemon.sh start tasktracker
ssh hadoop-slave3 hadoop-daemon.sh start datanode
ssh hadoop-slave3 hadoop-daemon.sh start tasktracker
