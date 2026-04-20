kind: cmake
description: qt6-webchannel

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtwebchannel-everywhere-src-6.9.3.tar.xz
  ref: 9457bbc1e5a13d9cf277c1fc121cdeb0a21546abf7fba091779b7ce9806fa305
