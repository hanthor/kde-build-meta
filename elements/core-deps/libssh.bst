kind: cmake
description: libssh - SSH library

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/openssl.bst

depends:
- freedesktop-sdk.bst:components/openssl.bst

variables:
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DWITH_EXAMPLES=OFF
    -DWITH_SERVER=ON
    -DBUILD_SHARED_LIBS=ON
    -DUNIT_TESTING=OFF

sources:
- kind: git_repo
  url: gitlab:libssh/libssh-mirror.git
  track: 'libssh-0.*'
  ref: libssh-0.9.8-0-gd18bd233582a33f6768fe55148740fd6f9c3848c
