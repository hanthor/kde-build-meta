kind: cmake
description: kstatusnotifieritem

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kstatusnotifieritem.git
  track: v6.22.0
  ref: 6b5a8512ddb04d219c784abb01b0febc8a21891a
