kind: cmake
description: qt6-qthttpserver

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qtdeclarative.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qthttpserver-everywhere-src-6.9.3.tar.xz
  ref: 7aa78793dba5cfb81a1d1e4b840bf0faf1e31beea08945b5689f404160dd2e8f
