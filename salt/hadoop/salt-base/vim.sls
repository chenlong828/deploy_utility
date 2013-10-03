vim:
  pkg.installed

/etc/vimrc:
  file.managed:
    - source: salt://etc/vimrc
    - mode: 644
    - user: root
    - group: root
