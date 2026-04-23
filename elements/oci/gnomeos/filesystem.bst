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
  overlap-whitelist:
  - /etc/issue
  - /etc/issue.net
  - /etc/os-release
  - /usr/lib/os-release
  - /etc/default/useradd
