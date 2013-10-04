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

/opt/hadoop:
  file.symlink:
    - target: /opt/hadoop-1.2.1

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

/opt/hbase:
  file.symlink:
    - target: /opt/hbase-0.94.1

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

/opt/hive:
  file.symlink:
    - target: /opt/hive-0.10.0

