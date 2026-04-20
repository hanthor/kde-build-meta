kind: cmake
description: kdoctools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/frameworks/karchive.bst
- kde/frameworks/ki18n.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kdoctools.git
  track: v6.22.0
  ref: 262b458d03474e9160afa17baf7186848891b122
