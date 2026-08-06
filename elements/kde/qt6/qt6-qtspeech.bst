kind: cmake
description: Qt6 speech module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qtdeclarative.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/qt6/qt6-qtmultimedia.bst

sources:
- kind: git_repo
  url: github:qt/qtspeech.git
  track: 'v6.*'
  exclude:
  - '*rc*'
  - '*alpha*'
  - '*beta*'
  ref: v6.11.1-0-g52081e9d3ce3968f5b6335a5cc5c80620279b031
