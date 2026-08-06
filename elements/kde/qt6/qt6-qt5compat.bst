kind: cmake
description: Qt6 Qt5 compatibility module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst

sources:
- kind: git_repo
  url: github:qt/qt5compat.git
  track: 'v6.*'
  exclude:
  - '*rc*'
  - '*alpha*'
  - '*beta*'
  ref: v6.11.1-0-gc1e3fdd994e6d54daeb545c6a9507d3201def264
