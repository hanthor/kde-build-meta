kind: cmake
description: breeze-icons

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/breeze-icons.git
  track: v6.22.0
  ref: 81dc0bd7b6141baea1819138505f9486719d3084
