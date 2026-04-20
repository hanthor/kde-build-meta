kind: cmake
description: solid

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/solid.git
  track: v6.22.0
  ref: bee90e244b43f7a05ae6c7458e4d1c414438b5d7
