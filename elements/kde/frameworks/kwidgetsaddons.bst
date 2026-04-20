kind: cmake
description: kwidgetsaddons

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kwidgetsaddons.git
  track: v6.22.0
  ref: 7d692d195f59c07a8a423d91a3de9e4a2c93db1f
