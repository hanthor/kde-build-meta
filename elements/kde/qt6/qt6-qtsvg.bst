kind: cmake
description: Qt6 SVG module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtsvg-everywhere-src-6.9.3.tar.xz
  ref: db76aa3358cbbe6fce7da576ff4669cb9801920188c750d3b12783bbe97026e2
