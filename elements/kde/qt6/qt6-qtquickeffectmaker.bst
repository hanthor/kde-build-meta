kind: cmake
description: qt6-qtquickeffectmaker

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtquickeffectmaker-everywhere-src-6.9.3.tar.xz
  ref: 6bf0361d24a0865cba9d94ff169c64cd69ac5d90c85260c29ec84ee5c2a59912
