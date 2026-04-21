kind: cmake
description: kcolorscheme

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qttools.bst
- kde/frameworks/kcodecs.bst
- kde/frameworks/kconfig.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kcolorscheme.git
  track: v6.22.0
  ref: 7972879c36f6ce07cfdda04b01d258185f6d044b
