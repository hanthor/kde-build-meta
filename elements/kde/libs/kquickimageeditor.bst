kind: cmake
description: kquickimageeditor

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:libraries/kquickimageeditor.git
  track: master
  ref: d1ae60cde0c821ce207a52069f4b43ad77819991
