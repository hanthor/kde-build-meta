kind: compose

build-depends:
- oci/gnomeos/stack.bst
- oci/gnomeos/manifest.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - extra
  - static-blocklist
