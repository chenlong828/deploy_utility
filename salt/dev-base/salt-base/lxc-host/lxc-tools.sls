/var/lib/lxc/ubuntu-base.tar.gz:
  file.managed:
    - source: salt://packages/ubuntu-base.tar.gz
    - mode: 644
    - user: root
    - group: root

/var/lib/lxc/deploy.sh:
  file.managed:
    - source: salt://lxc-host/scripts/deploy.sh
    - mode: 744
    - user: root
    - group: root
