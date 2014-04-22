/etc/hosts:
  file.managed:
    - source: salt://etc/hosts
    - mode: 644
    - user: root
    - group: root

/root/.ssh/authorized_keys:
  file.managed:
    - source: salt://ssh/authorized_keys
    - mode: 644
    - user: root
    - group: root

/root/.ssh/id_rsa:
  file.managed:
    - source: salt://ssh/id_rsa
    - mode: 600
    - user: root
    - group: root
