rabbitmq-server:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: rabbitmq-server
      - file: /etc/rabbitmq/enabled_plugins

/etc/rabbitmq/enabled_plugins:
  file.managed:
    - source: salt://lxc-sandbox/etc/rabbitmq/enabled_plugins
    - mode: 644
    - user: root
    - group: root
