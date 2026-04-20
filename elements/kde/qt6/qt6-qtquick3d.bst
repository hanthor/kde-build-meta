kind: cmake
description: qt6-qtquick3d

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtquick3d-everywhere-src-6.9.3.tar.xz
  ref: 91b270049f38ad2b7370c2e6edc72c19ed7d5d2281d914457586f29daccace73
