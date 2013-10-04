/opt/hadoop/conf/*:
  file.managed:
    - source: salt://scripts/hadoop/distribute/*
    - mode: 644
    - user: root
    - group: root
