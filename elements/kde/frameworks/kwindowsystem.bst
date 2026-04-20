kind: cmake
description: kwindowsystem

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kwindowsystem.git
  track: v6.22.0
  ref: ad68ea2cc4205c524d1766b457a7c5eec2bf9bbf
