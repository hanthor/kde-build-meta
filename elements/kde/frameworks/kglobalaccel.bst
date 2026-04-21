kind: cmake
description: kglobalaccel

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qttools.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DWITH_X11=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kglobalaccel.git
  track: v6.22.0
  ref: 034e5f9695f26ad8d11b010c432ebdc30cd01ca5
