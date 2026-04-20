kind: cmake
description: Qt6 virtual keyboard module

build-depends:
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtsvg.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtvirtualkeyboard-everywhere-src-6.9.3.tar.xz
  ref: sha256:62a7e3ad4a13c9a87b7dc6f07e96d6acb7d1025af8aa6e89aac36fd4db1e9c3a
