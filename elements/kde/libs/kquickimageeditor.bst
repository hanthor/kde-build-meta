kind: cmake
description: kquickimageeditor

build-depends:
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:libraries/kquickimageeditor.git
  track: master
  ref: d1ae60cde0c821ce207a52069f4b43ad77819991
