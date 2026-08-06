kind: cmake
description: phonon

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DPHONON_BUILD_QT5=OFF
    -DPHONON_BUILD_QT6=ON

sources:
- kind: git_repo
  url: kde:libraries/phonon.git
  track: master
  ref: v4.12.0-60-gb73bbbe621143dca1a619b0ddfd3c02f078726b9
