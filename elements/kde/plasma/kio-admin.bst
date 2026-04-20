kind: cmake
description: kio-admin - KIO worker for admin file operations

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:system/kio-admin.git
  track: release/25.04
  ref: 0a33652a901a702813d617c2e1a29af1c0379d42
