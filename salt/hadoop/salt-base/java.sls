/opt/jdk-6u34-linux-x64.bin:
  file.managed:
    - source: salt://packages/jdk-6u34-linux-x64.bin
    - mode: 644
    - user: root
    - group: root

install-jdk:
  cmd:
    - cwd: /opt
    - names:
      - jdk-6u34-linux-x64.bin << echo -e "\t"
    - run
    - require:
      - file: /opt/jdk-6u34-linux-x64.bin