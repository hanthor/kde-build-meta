kind: cmake
description: drkonqi - KDE crash handler

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:plasma/drkonqi.git
  track: Plasma/6.6
  ref: b4c1e9ccab90b2cf51edf4c0026cc8715fd1ac19
