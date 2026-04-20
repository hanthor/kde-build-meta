kind: cmake
description: kpty

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kpty.git
  track: v6.22.0
  ref: 9b9bb2ea528b39aeafc7fdd51aadc500370696da
