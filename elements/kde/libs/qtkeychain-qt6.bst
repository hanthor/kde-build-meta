kind: cmake
description: qtkeychain - Qt API to store passwords securely

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/qt6/qt6-qttools.bst
- sdk/libsecret.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DBUILD_WITH_QT6=ON

sources:
- kind: git_repo
  url: github:frankosterfeld/qtkeychain.git
  track: main
  ref: 0.15.0-45-g7718d0ac928f1eb46caf2fc9a08ffd7ae2a87ae5
