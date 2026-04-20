kind: cmake
description: knotifyconfig

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/knotifyconfig.git
  track: v6.22.0
  ref: 8f322639919f565da251b45d338181a8239d9574
