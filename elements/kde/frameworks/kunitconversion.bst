kind: cmake
description: kunitconversion

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kunitconversion.git
  track: v6.22.0
  ref: bcb5524d458e7a7303d3bf7fcb81d77f706df47a
