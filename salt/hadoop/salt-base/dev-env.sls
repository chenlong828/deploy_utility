/etc/environment:
  file.managed:
    - source: salt://etc/environment-salt
    - mode: 644
    - user: root
    - group: root
