kind: cmake
description: polkit-qt-1

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:libraries/polkit-qt-1.git
  track: master
  ref: 328a4c8615c7207e1297b776026657a77c6a71b6
