/opt/jdk-6u34-linux-x64.bin:
  file.managed:
    - source: salt://packages/jdk-6u34-linux-x64.bin
    - mode: 644
    - user: root
    - group: root

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

/etc/environment:
  file.managed:
    - source: salt://lxc-sandbox/etc/environment
    - mode: 644
    - user: root
    - group: root
