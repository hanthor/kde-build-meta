kind: cmake
description: Qt6 shader tools module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtshadertools-everywhere-src-6.9.3.tar.xz
  ref: 629804ee86a35503e4b616f9ab5175caef3da07bd771cf88a24da3b5d4284567
