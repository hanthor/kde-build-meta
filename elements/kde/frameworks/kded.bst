kind: cmake
description: kded

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kded.git
  track: v6.22.0
  ref: 319f8030471ed776eb5aea1c9ce939165c31b5ee
