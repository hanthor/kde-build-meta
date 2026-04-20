kind: cmake
description: Qt6 declarative (QML) module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/python3.bst
- kde/qt6/qt6-qtbase.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtdeclarative-everywhere-src-6.9.3.tar.xz
  ref: 5a071b227229afbf5c976b7b59a0d850818d06ae861fcdf6d690351ca3f8a260
