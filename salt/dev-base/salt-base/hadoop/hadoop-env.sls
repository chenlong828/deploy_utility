/etc/environment:
  file.managed:
    - source: salt://etc/environment
    - mode: 644
    - user: root
    - group: root
