kind: cmake
description: kdeconnect - KDE Connect device integration

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:network/kdeconnect-kde.git
  track: release/25.04
  ref: cb53c0cf5e7428e8d7c38d02903e06f371431ae5
