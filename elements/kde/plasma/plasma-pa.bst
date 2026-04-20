kind: cmake
description: plasma-pa - Plasma PulseAudio integration

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:plasma/plasma-pa.git
  track: Plasma/6.6
  ref: 111fa0e6089aca84fe4e75d2cbebbc60fb811ea3
