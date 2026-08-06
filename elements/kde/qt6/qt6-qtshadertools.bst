kind: cmake
description: Qt6 shader tools module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

sources:
- kind: git_repo
  url: github:qt/qtshadertools.git
  track: 'v6.*'
  exclude:
  - '*rc*'
  - '*alpha*'
  - '*beta*'
  ref: v6.11.1-0-gb3b8537b3c5ab01919e30b87d48d2f1ba1f2a3fe
