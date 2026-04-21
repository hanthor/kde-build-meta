kind: cmake
description: qt6-qtquicktimeline

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qtdeclarative.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtquicktimeline-everywhere-src-6.9.3.tar.xz
  ref: 284f4ba65ea71fa32751525c845f540c99d2f86fed88387e8c3d5869cf6c11f7
