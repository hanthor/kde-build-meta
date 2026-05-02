kind: manual
description: SDDM configuration for Wayland

sources:
- kind: local
  path: files/kde/config/10-sddm-wayland.conf

config:
  install-commands:
  - install -D -m 0644 10-sddm-wayland.conf %{install-root}/etc/sddm.conf.d/10-sddm-wayland.conf
