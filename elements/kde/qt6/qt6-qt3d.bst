kind: cmake
description: qt6-qt3d

variables:
  cmake-local: -DQT_FEATURE_qt3d_assimp=OFF

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qtdeclarative.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

sources:
- kind: git_repo
  url: github:qt/qt3d.git
  track: 'v6.*'
  exclude:
  - '*rc*'
  - '*alpha*'
  - '*beta*'
  ref: v6.11.1-0-g1f4c3a7548201bcad21a273a49060c96ad9ff3a9
