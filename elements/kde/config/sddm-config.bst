kind: manual
description: SDDM configuration for Wayland

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: local
  path: files/kde/config/10-sddm-wayland.conf

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -D -m 0644 10-sddm-wayland.conf %{install-root}/etc/sddm.conf.d/10-sddm-wayland.conf
