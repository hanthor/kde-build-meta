kind: cmake
description: qt6-qtcharts

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qtdeclarative.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtcharts-everywhere-src-6.9.3.tar.xz
  ref: 29d7cbbdb31d6a2e6c3ab5b5b52f34ff457db55d87d28a7c335b015d749d4c53
