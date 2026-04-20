kind: cmake
description: elisa - KDE music player

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:multimedia/elisa.git
  track: release/25.04
  ref: 0cd8f30422dfe201f6f7b75010fb287eccbcf6fa
