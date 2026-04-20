kind: cmake
description: libqaccessibilityclient

build-depends:
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:libraries/libqaccessibilityclient.git
  track: master
  ref: 783ff72b58aceeb788d0ac2a86f5f6da5a8310e7
