/opt/zookeeper-3.3.5.tar.gz:
  file.managed:
    - source: salt://packages/zookeeper-3.3.5.tar.gz
    - mode: 644
    - user: root
    - group: root

extract_zookeeper:
  cmd:
    - cwd: /opt
    - names:
      - tar xvpf zookeeper-3.3.5.tar.gz
    - run
    - user: root
    - require:
      - file: /opt/zookeeper-3.3.5.tar.gz

/opt/zookeeper:
  file.symlink:
    - target: /opt/zookeeper-3.3.5

/opt/zookeeper/conf/zoo.cfg:
  file.managed:
    - source: salt://scripts/zookeeper/distribute/zoo.cfg
    - mode: 644
    - user: root
    - group: root
