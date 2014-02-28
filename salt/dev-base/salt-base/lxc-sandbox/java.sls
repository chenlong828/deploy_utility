time_zone:
  cmd:
    - names:
    - cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && date
    - run
    - user: root

/opt/jdk-6u34-linux-x64.bin:
  file.managed:
    - source: salt://packages/jdk-6u34-linux-x64.bin
    - mode: 644
    - user: root
    - group: root
    - require:
      - cmd: time_zone

chmod_jdk:
  cmd:
    - cwd: /opt
    - names:
      - chmod +x jdk-6u34-linux-x64.bin
    - run
    - user: root
    - require:
      - file: /opt/jdk-6u34-linux-x64.bin

install_jdk:
  cmd:
    - cwd: /opt
    - names:
      - ./jdk-6u34-linux-x64.bin << echo -e "\t" && ln -s jdk1.6.0_34 jdk
    - run
    - user: root
    - require:
      - cmd: chmod_jdk

subversion:
  pkg:
    - installed

unzip:
  pkg:
    - installed

/opt/apache-maven-2.2.1-bin.zip:
  file.managed:
    - source: salt://packages/apache-maven-2.2.1-bin.zip
    - mode: 644
    - user: root
    - group: root

install_maven:
  cmd:
    - cwd: /opt
    - names:
      - unzip apache-maven-2.2.1-bin.zip && ln -s apache-maven-2.2.1 maven
    - run
    - user: root
    - requre:
      - file: /opt/apache-maven-2.2.1-bin.zip
      - package: unzip

/etc/environment:
  file.managed:
    - source: salt://lxc-sandbox/etc/environment
    - mode: 644
    - user: root
    - group: root
