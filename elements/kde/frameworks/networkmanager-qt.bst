kind: cmake
description: networkmanager-qt

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/networkmanager-qt.git
  track: v6.22.0
  ref: b3d506192606ba7e98935c43f7717d1f09002bca
