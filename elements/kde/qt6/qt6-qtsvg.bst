kind: cmake
description: Qt6 SVG module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: -DINSTALL_ARCHDATADIR=lib

sources:
- kind: git_repo
  url: github:qt/qtsvg.git
  track: 'v6.*'
  exclude:
  - '*rc*'
  - '*alpha*'
  - '*beta*'
  ref: v6.11.1-0-g2596f43da2dc72d2afecc084355b0f5f87922a6c
