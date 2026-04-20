kind: cmake
description: kguiaddons

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kguiaddons.git
  track: v6.22.1
  ref: 17e9692201952da82f27791c56276fb7d82582b4
