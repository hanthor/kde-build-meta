kind: cmake
description: qt6-qtquick3dphysics

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qtdeclarative.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtquick3dphysics-everywhere-src-6.9.3.tar.xz
  ref: dcd7b22d745d249eb602c5d4d8af8a8e9d11217ccb42b3dd611bb047153b5a6e
