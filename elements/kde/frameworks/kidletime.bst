kind: cmake
description: kidletime

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DWITH_X11=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kidletime.git
  track: v6.22.0
  ref: 064374fa4737c36563224de6673d6ab4cda4271b
