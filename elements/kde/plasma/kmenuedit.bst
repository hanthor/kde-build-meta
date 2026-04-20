kind: cmake
description: kmenuedit - KDE menu editor

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:plasma/kmenuedit.git
  track: Plasma/6.6
  ref: 005acb1f722eb889e1bd4405103cc68aa7f1f06e
