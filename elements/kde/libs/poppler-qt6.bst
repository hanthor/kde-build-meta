kind: cmake
description: poppler Qt6 bindings

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/poppler.bst

variables:
  cmake-options: >-
    -DBUILD_TESTING=OFF
    -DENABLE_QT5=OFF
    -DENABLE_QT6=ON
    -DENABLE_GLIB=OFF
    -DENABLE_CPP=OFF
    -DENABLE_UTILS=OFF

depends:
- kde/qt6/qtbase.bst

sources:
- kind: git_repo
  url: freedesktop:poppler/poppler.git
  track: master
  ref: e3d56a0e4b4a243ac9f4ab100325c95386f87521
