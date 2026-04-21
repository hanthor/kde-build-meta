kind: cmake
description: kdbusaddons

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qttools.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DWITH_X11=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kdbusaddons.git
  track: v6.22.0
  ref: 367293ddf33df44e717af2f4e69a76241da3fa9a
