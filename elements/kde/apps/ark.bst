kind: cmake
description: ark - KDE archive manager

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:utilities/ark.git
  track: release/25.04
  ref: 233870783fad85db275a746226d178b2d2ad5c4b
