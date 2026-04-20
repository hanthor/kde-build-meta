kind: cmake
description: ktexteditor

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/ktexteditor.git
  track: v6.22.0
  ref: 8d720355fb9e7a6f4ea99f883b90ea36d275e857
