kind: cmake
description: krunner

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/krunner.git
  track: v6.22.0
  ref: bfe9f124da65472f05514198777d80c53ce8a4e6
