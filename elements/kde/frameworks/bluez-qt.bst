kind: cmake
description: bluez-qt

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/bluez-qt.git
  track: v6.22.0
  ref: b6426b8ff8cb24229fd5cb2331b4338dc7a563a2
