kind: cmake
description: syndication

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/syndication.git
  track: v6.22.0
  ref: 6d026ee0d162bf6ff16f621611dea1114a848651
