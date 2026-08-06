kind: cmake
description: kquickimageeditor

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/frameworks/kconfig.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DWITH_OPENCV=OFF

sources:
- kind: git_repo
  url: kde:libraries/kquickimageeditor.git
  track: master
  ref: v0.6.2.1-0-g9490a7227be3054f59c24e95a265b4356762716a
