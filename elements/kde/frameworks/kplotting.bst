kind: cmake
description: kplotting

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kplotting.git
  track: v6.22.0
  ref: 7f86fa34480c90861ca9f15f98a99410d26aa85b
