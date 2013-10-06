/opt/hadoop/conf/:
  file.recurse:
    - source: salt://scripts/hadoop/distribute/
    - user: root
    - group: root
