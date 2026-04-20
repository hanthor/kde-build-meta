kind: cmake
description: phonon

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:libraries/phonon.git
  track: master
  ref: fac676a3699a7c82c8b703d75fa7ee133e0046e1
