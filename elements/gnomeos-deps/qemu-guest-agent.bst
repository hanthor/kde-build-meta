kind: meson

description: QEMU guest agent for virtual machine integration

sources:
- kind: tar
  url: qemu:qemu-10.1.3.tar.xz
  ref: fbaa7a0d7a9a1deb5695b125916746ec28fe0de6275d4454f3e3bbaf8b339b53

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/pkg-config.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/fuse3.bst

variables:
  meson-local: >-
    --target-list=
    -Dguest_agent=enabled
    -Dguest_agent_msi=disabled
    -Dtools=disabled
    -Ddocumentation=disabled
    -Dwerror=false
    -Dfuse=enabled
    -Dvirtfs=disabled
    -Dblkio=disabled
    -Daio=posix

config:
  install-commands:
    (>):
    # Only keep the guest agent binary and its systemd units
    - find '%{install-root}' -name 'qemu-ga' -o -name 'qemu-guest-agent*' | head -5
