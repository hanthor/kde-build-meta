kind: cmake
description: qt6-qtremoteobjects

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtremoteobjects-everywhere-src-6.9.3.tar.xz
  ref: 98987c0055d4e1a6d31dac85c3445d99ed8142c21995f70b391ef0ebafaad85b
