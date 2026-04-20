kind: cmake
description: gwenview - KDE image viewer

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:graphics/gwenview.git
  track: release/25.04
  ref: 5c5fb0973378eeeb3a7bb075b69523e7d4504a8f
