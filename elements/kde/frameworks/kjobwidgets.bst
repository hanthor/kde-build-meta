kind: cmake
description: kjobwidgets

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kjobwidgets.git
  track: v6.22.0
  ref: 7127a083a2484484c95bfc3c6f839634b2a19ccc
