kind: cmake
description: libqaccessibilityclient

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:libraries/libqaccessibilityclient.git
  track: master
  ref: v0.6.0-13-gc80da37136fcacec30078cb586e56a0cbe52ecdc
