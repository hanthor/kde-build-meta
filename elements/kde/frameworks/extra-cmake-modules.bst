kind: cmake
description: extra-cmake-modules

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/extra-cmake-modules.git
  track: v6.22.0
  ref: 3f76d71045e935ced4723c12345162f16cc8cb21
