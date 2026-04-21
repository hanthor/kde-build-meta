kind: manual
description: Boost C++ Libraries (headers-only install)

variables:
  conf-cmd: ""
  build-cmd: ""
  install-cmd: |
    install -d "%{install-root}/usr/include"
    cp -r boost "%{install-root}/usr/include/"

sources:
- kind: tar
  url: boost_io:release/1.87.0/source/boost_1_87_0.tar.bz2
  ref: af57be25cb4c4f4b413ed692fe378affb4352ea50fbe294a11ef548f4d527d89
  base-dir: boost_1_87_0
