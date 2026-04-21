kind: cmake
description: Qt6 Qt5 compatibility module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qt5compat-everywhere-src-6.9.3.tar.xz
  ref: 091dac2124c2291c3566408720f89b1796cd458897c6acabd11f03976ad04461
