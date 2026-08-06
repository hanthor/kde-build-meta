kind: cmake
description: pulseaudio-qt - Qt bindings for libpulse

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/libpulse.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:libraries/pulseaudio-qt.git
  track: master
  ref: v1.8.1-4-g5c351ed09a33ebdc8d4292d988b8aaddf2929243
