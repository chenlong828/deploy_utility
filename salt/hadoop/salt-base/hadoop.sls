/opt/hadoop-1.2.1-bin.tar.gz:
  file.managed:
    - source: salt://packages/hadoop-1.2.1-bin.tar.gz
    - mode: 644
    - user: root
    - group: root

extract_hadoop:
  cmd:
    - cwd: /opt
    - names:
      - tar xvpf hadoop-1.2.1-bin.tar.gz
    - run
    - user: root
    - require:
      - file: /opt/hadoop-1.2.1-bin.tar.gz

init_hadoop:
  cmd:
    - cwd: /opt
    - names:
      - ln -s hadoop-1.2.1 hadoop
    - run
    - user: root
    - require:
      - cmd: extract_hadoop

/opt/hbase-0.94.11.tar.gz:
  file.managed:
    - source: salt://packages/hbase-0.94.11.tar.gz
    - mode: 644
    - user: root
    - group: root

extract_hbase:
  cmd:
    - cwd: /opt
    - names:
      - tar xvpf hbase-0.94.11.tar.gz
    - run
    - user: root
    - require:
      - file: /opt/hbase-0.94.11.tar.gz

init_hbase:
  cmd:
    - cwd: /opt
    - names:
      - ln -s hbase-0.94.11 hbase
    - run
    - user: root
    - require:
      - cmd: extract_hbase

/opt/hive-0.10.0.tar.gz:
  file.managed:
    - source: salt://packages/hive-0.10.0.tar.gz
    - mode: 644
    - user: root
    - group: root

extract_hive:
  cmd:
    - cwd: /opt
    - names:
      - tar xvpf hive-0.10.0.tar.gz
    - run
    - user: root
    - require:
      - file: /opt/hive-0.10.0.tar.gz

init_hive:
  cmd:
    - cwd: /opt
    - names:
      - ln -s hive-0.10.0 hive
    - run
    - user: root
    - require:
      - cmd: extract_hive
