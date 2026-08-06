kind: cmake
description: Qt6 virtual keyboard module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/hunspell.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtmultimedia.bst
- kde/qt6/qt6-qtsvg.bst

depends:
- freedesktop-sdk.bst:components/hunspell.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtmultimedia.bst
- kde/qt6/qt6-qtsvg.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: github:qt/qtvirtualkeyboard.git
  track: 'v6.*'
  exclude:
  - '*rc*'
  - '*alpha*'
  - '*beta*'
  ref: v6.11.1-0-g2eb5eda48077645a88609f7e6237cd5598253d8a
