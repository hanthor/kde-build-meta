kind: cmake
description: kxmlgui

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kxmlgui.git
  track: v6.22.0
  ref: cc8ef30b396de591ca0cc261a4776d56c2615bc1
