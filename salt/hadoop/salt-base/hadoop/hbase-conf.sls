/opt/hbase/conf:
  file.recurse:
    - source: salt://scripts/hbase/distribute
    - include_empty: True
    - user: root
    - group: root
