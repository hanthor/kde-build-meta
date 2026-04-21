kind: cmake
description: qt6-qt3d

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qtdeclarative.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qt3d-everywhere-src-6.9.3.tar.xz
  ref: 7e8664ddf21a79d4eeaebf76dddf017ed31142a2df005cf4ac784dff10627fff
