kind: cmake
description: networkmanager-qt

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DWITH_NMQT_STATIC=OFF

sources:
- kind: git_repo
  url: kde:frameworks/networkmanager-qt.git
  track: v6.22.0
  ref: b3d506192606ba7e98935c43f7717d1f09002bca
