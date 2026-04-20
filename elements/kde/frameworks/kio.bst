kind: cmake
description: kio

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kio.git
  track: v6.22.0
  ref: 1f471941c4be1de739322ed302266aea85de68c7
